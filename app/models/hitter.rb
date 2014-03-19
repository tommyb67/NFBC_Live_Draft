class Hitter < ActiveRecord::Base
require 'roo'

    def self.import(file)
      allowed_attributes = ["product_id", "name", "pos1", "pos2", "pos3", 'ab', "run", "hit", "hr", "rbi", "sb", "avg", "zola_mix12", "zola_rank"]
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        hitter = find_by_id(row["id"]) || new
        hitter.attributes = row.to_hash.select { |k,v| allowed_attributes.include? k }
        hitter.save!
      end
    end

    def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
      when 'csv' then Roo::Csv.new(file.path, nil, :ignore)
      when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
      when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknowm file type: #{file.original_filename}"
    end
   end

end