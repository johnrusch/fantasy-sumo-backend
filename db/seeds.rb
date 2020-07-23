# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# DESTROYS PRE-EXISTING DATA
Match.destroy_all
User.destroy_all
Team.destroy_all
League.destroy_all

#CREATES LEAGUE
league = League.create(name: "league")

#CREATES USERS
john = User.new(name: "John", password: "john", email: "johnrusch7@gmail.com")
john.leagues << league

tommy = User.new(name: "Tommy", password: "tommy")
tommy.leagues << league

mason = User.new(name: "Mason", password: "mason")
mason.leagues << league

reid = User.new(name: "Reid", password: "reid")
reid.leagues << league

matt = User.new(name: "Matt", password: "matt")
matt.leagues << league

glenn = User.new(name: "Glenn", password: "glenn")
glenn.leagues << league

josh = User.new(name: "Josh", password: "josh")
josh.leagues << league

#CREATES TEAMS
john_team = Team.new(name: "john_team", points: 0)
tommy_team = Team.new(name: "tommy_team", points: 0)
mason_team = Team.new(name: "mason_team", points: 0)
reid_team = Team.new(name: "reid_team", points: 0)
matt_team = Team.new(name: "matt_team", points: 0)
glenn_team = Team.new(name: "glenn_team", points: 0)
josh_team = Team.new(name: "josh_team", points: 0)

#ADDS WRESTLERS TO EACH TEAM
john_wrestlers = ["Mitakeumi", "Takanosho", "Enho", "Kagayaki", "Ishiura"]
john_wrestlers.each do |wrestler|
    john_team.wrestlers << Wrestler.find_by(name: wrestler)
end
john.teams << john_team
john_team.league = league
john_team.save
john.save

tommy_wrestlers = ["Kakuryu", "Takayasu", "Ikioi", "Shimanoumi", "Chiyomaru"]
tommy_wrestlers.each do |wrestler|
    tommy_team.wrestlers << Wrestler.find_by(name: wrestler)
end
tommy.teams << tommy_team
tommy_team.league = league
tommy_team.save
tommy.save

mason_wrestlers = ["Asanoyama", "Yutakayama", "Abi", "Onosho", "Kotonowaka"]
mason_wrestlers.each do |wrestler|
    mason_team.wrestlers << Wrestler.find_by(name: wrestler)
end
mason.teams << mason_team
mason_team.league = league
mason_team.save
mason.save

reid_wrestlers = ["Hakuho", "Kiribayama", "Hokutofuji", "Kaisei", "Tamawashi"]
reid_wrestlers.each do |wrestler|
    reid_team.wrestlers << Wrestler.find_by(name: wrestler)
end
reid.teams << reid_team
reid_team.league = league
reid_team.save
reid.save

matt_wrestlers = ["Shodai", "Ryuden", "Aoiyama", "Nishikigi", "Terutsuyoshi"]
matt_wrestlers.each do |wrestler|
    matt_team.wrestlers << Wrestler.find_by(name: wrestler)
end
matt.teams << matt_team
matt_team.league = league
matt_team.save
matt.save

glenn_wrestlers = ["Endo", "Wakatakakage", "Daieisho", "Takarafuji", "Kotoshoho"]
glenn_wrestlers.each do |wrestler|
    glenn_team.wrestlers << Wrestler.find_by(name: wrestler)
end
glenn.teams << glenn_team
glenn_team.league = league
glenn_team.save
glenn.save

josh_wrestlers = ["Takakeisho", "Okinoumi", "Tochinoshin", "Tokushoryu", "Shohozan"]
josh_wrestlers.each do |wrestler|
    josh_team.wrestlers << Wrestler.find_by(name: wrestler)
end
josh.teams << josh_team
josh_team.league = league
josh_team.save
josh.save

#SCRAPES BANZUKE
# banzuke_scrape = BanzukeScraper.new
# banzuke_scrape.scrape_banzuke

#SCRAPES MATCH DATA
scrape = Scraper.new
scrape.scrape_results_page

