require 'nokogiri'
require 'open-uri'
# require 'pry'

class BanzukeScraper
    def scrape_banzuke

        results_url = 'http://sumodb.sumogames.de/'

        html = open(results_url)
        doc = Nokogiri::HTML(html)
        # gets matches table
        banzuke_rows = doc.css(".banzuke").css("tbody").css("tr")
        
        banzuke_rows.each do |row|
            east_wrestler = row.css(".shikona").first.css("a").text
            e_wrestler = Wrestler.find_or_create_by(name: east_wrestler)

            west_wrestler = row.css(".shikona").last.css("a").text
            w_wrestler = Wrestler.find_or_create_by(name: west_wrestler)

            e_wrestler_record = row.css("td").first.css("a").text
            w_wrestler_record = row.css("td").last.css("a").text
            e_wrestler.current_record = e_wrestler_record
            w_wrestler.current_record = w_wrestler_record

            e_wrestler.save
            w_wrestler.save
        end



    end

end

# banzuke_scraper = BanzukeScraper.new
# banzuke_scraper.scrape_page
