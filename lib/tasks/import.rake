require 'roo'

namespace :import do
  desc "Import data from spreadsheet"
  task data: :environment do
    puts "Importing Data"

    data = Roo::Spreadsheet.open('lib/Wrestlers7_16.xlsx')
    headers = data.row(1)

    data.each_with_index do |row, idx|
      next if idx == 0

      wrestler_data = Hash[[headers, row].transpose]

      wrestler = Wrestler.new(wrestler_data)

      puts "Saving #{wrestler.name}"
      wrestler.save!
    end
  end

end
