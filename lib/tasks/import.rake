require 'roo'

namespace :import do
  desc "Import data from spreadsheet"
  task data: :environment do
    puts "Importing Data"

    data = Roo::Spreadsheet.open('lib/Wrestler_stats4_16.xlsx')
    #sets headers to the first row from spreadsheet
    headers = data.row(1)

    #goes through each wrestler and creates data hash
    data.each_with_index do |row, idx|
      next if idx == 0

      wrestler_data = Hash[[headers, row].transpose]

      wrestler = Wrestler.new(wrestler_data)
      wrestler.name = wrestler.name.capitalize()

      wrestler.active = true
      puts "Saving #{wrestler.name}"
      wrestler.save!
    end

  end

  task records: :environment do
    records = Roo::Spreadsheet.open('lib/records.xlsx')
    headers = records.row(1)
  
    records.each_with_index do |row, idx|
      next if idx == 0
      record_data = Hash[[headers, row].transpose]
      wrestler = Wrestler.find_by(name: record_data["Wrestler"])
      next if !wrestler
      record_data.shift()
      record_data.each do |record|
        wins_losses = record[1].split("-")
        wins = wins_losses[0].to_i
        losses = wins_losses[1].to_i
        record_hash = {}
        record_hash[:tournament] = record[0]
        record_hash[:wins] = wins
        record_hash[:losses] = losses
        new_record = Record.new(record_hash)
        wrestler.records << new_record
      end
      
    end

  end

  task :matches, [:url, :tournament] => [:environment] do |t, args|
    scrape = Scraper.new
    scrape.scrape_results_page(args[:url], args[:tournament])
    puts "successful scrape!"
  end
  
end
