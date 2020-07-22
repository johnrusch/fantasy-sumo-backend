require 'nokogiri'
require 'open-uri'
require 'pry'

class BanzukeScraper
    def scrape_results_page

        results_url = 'http://sumodb.sumogames.de/'

        html = open(results_url)
        doc = Nokogiri::HTML(html)
        # gets matches table
        banzuke_rows = doc.css(".banzuke").css("tbody").css("tr")
        
        ranks = [0, "K", "S", "O", "Y"]
        wrestler_rows.each do |row|

            east_wrestler = row.css(".tk_east").css("a").first.children.text
            e_wrestler = Wrestler.find_or_create_by(name: east_wrestler)
            if ranks.include?(e_wrestler.current_rank)
                e_wrestler_rank = ranks.index(e_wrestler.current_rank)
            else
                e_wrestler_rank = 0
            end

            west_wrestler = row.css(".tk_west").css("a").first.children.text
            w_wrestler = Wrestler.find_or_create_by(name: west_wrestler)
            if ranks.include?(w_wrestler.current_rank)
                w_wrestler_rank = ranks.index(w_wrestler.current_rank)
            else
                w_wrestler_rank = 0
            end


            kimarite = row.css(".tk_kim").first.children[1].text
            win_or_loss = row.css(".tk_kekka").css("img").attribute('src').value
            if win_or_loss == "img/hoshi_shiro.gif"
                winner = e_wrestler
                if e_wrestler_rank >= w_wrestler_rank
                    points = 1
                else
                    points = 1 + (w_wrestler_rank - e_wrestler_rank)
                end
            else
                winner = w_wrestler
                if w_wrestler_rank >= e_wrestler_rank
                    points = 1
                else
                    points = 1 + (e_wrestler_rank - w_wrestler_rank)
                end
            end
            
            match_data = {
                day: day,
                kimarite: kimarite,
                winner: winner.name,
                points: points
            }
            match = Match.new(match_data)
            match.wrestlers << [e_wrestler, w_wrestler]
            match.save

            winner.teams.each do |team|
                team.points += match.points
                team.save
            end

        end



    end

end
