require 'nokogiri'
require 'open-uri'
# require 'pry'

class Scraper

    #rank array
    ranks = [0, "K", "S", "O", "Y"]

    def scrape_results_page(results_url, tournament)
    
        #opens and stores results page to be scraped
        html = open(results_url)
        doc = Nokogiri::HTML(html)
        # gets matches table
        wrestler_rows = doc.css(".layoutright").css(".tk_table").first.css("tr")
        # gets day of tournament
        day = doc.css(".layoutright").css("h1").first.text
        # removes day of tournament row
        wrestler_rows.shift()
        # # rank array to determine match points
        # ranks = [0, "K", "S", "O", "Y"]

        wrestler_rows.each do |row|

            #gets wrestlers name from results page
            east_wrestler = row.css(".tk_east").css("a").first.children.text
            #finds or creates wrestler
            e_wrestler = Wrestler.find_or_create_by(name: east_wrestler)
            #finds or creates wrester's record for current tournament
            ew_record = Record.find_or_create_by(tournament: tournament, wrestler: e_wrestler)
            #sets wrestler's division to current division
            e_wrestler.division = "East"

            e_wrestler.save

            #sets wrestler's rank for point assessment
            if ranks.include?(e_wrestler.current_rank)
                e_wrestler_rank = ranks.index(e_wrestler.current_rank)
            else
                e_wrestler_rank = 0
            end

            #gets wrestlers name from results page
            west_wrestler = row.css(".tk_west").css("a").first.children.text
            #finds or creates wrestler
            w_wrestler = Wrestler.find_or_create_by(name: west_wrestler)
            #finds or creates wrester's record for current tournament
            ww_record = Record.find_or_create_by(tournament: tournament, wrestler: w_wrestler)
            #sets wrestler's division to current division
            w_wrestler.division = "West"

            w_wrestler.save

            #sets wrestler's rank for point assessment
            if ranks.include?(w_wrestler.current_rank)
                w_wrestler_rank = ranks.index(w_wrestler.current_rank)
            else
                w_wrestler_rank = 0
            end

            #sets kimarite for match
            kimarite = row.css(".tk_kim").first.children[1].text
            #stores 'winner' in variable
            win_or_loss = row.css(".tk_kekka").css("img").attribute('src').value
            #conditionals to determine winner and assess points
            if win_or_loss == "img/hoshi_shiro.gif"
                winner = e_wrestler
                ew_record.wins += 1
                ww_record.losses += 1
                e_wrestler_rank >= w_wrestler_rank ? points = 1 : points = 1 + (w_wrestler_rank - e_wrestler_rank)
            elsif win_or_loss == "img/hoshi_fusensho.gif"
                winner = e_wrestler
                ew_record.wins += 1
                ww_record.losses += 1
                points = 1
                w_wrestler.active = false
            elsif win_or_loss == "img/hoshi_fusenpai.gif"
                winner = w_wrestler
                ww_record.wins += 1
                ew_record.losses += 1
                points = 1
                e_wrestler.active = false
            else
                winner = w_wrestler
                ww_record.wins += 1
                ew_record.losses += 1
                w_wrestler_rank >= e_wrestler_rank ? points = 1 : points = 1 + (e_wrestler_rank - w_wrestler_rank)
            end
            
            #match data hash for creating a new match in db
            match_data = {
                day: day,
                kimarite: kimarite,
                winner: winner.name,
                points: points
            }
            match = Match.new(match_data)
            match.wrestlers << [e_wrestler, w_wrestler]
            match.save

            #adds points to teams with winning wrestler
            winner.teams.each do |team|
                team.points += match.points
                team.save
            end

        end



    end

    def scrape_banzuke(url)
        html = open(url)
        doc = Nokogiri::HTML(html)

        banzuke_rows = doc.css(".banzuke").css("tbody").children.css('tr')
        banzuke_rows.each do |row|

            rank = row.css(".short_rank").text

            east_wrestler = row.css('.shikona').css('a').children.first.text
            e_wrestler = Wrestler.find_or_create_by(name: east_wrestler)
            e_wrestler.division = "East"
            e_wrestler.current_rank = rank
            e_wrestler.save

            west_wrestler = row.css('.shikona').css('a').children.last.text
            w_wrestler = Wrestler.find_or_create_by(name: west_wrestler)
            w_wrestler.division = "West"
            w_wrestler.current_rank = rank
            w_wrestler.save

            # binding.pry
        end
    end

end

scraper = Scraper.new
scraper.scrape_banzuke('http://sumodb.sumogames.de/Banzuke.aspx')

