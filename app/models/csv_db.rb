require 'csv'
class CsvDb
  class << self
    def convert_save(user, csv_data)
      csv_file = csv_data.read
      CSV.parse(csv_file) do |row|
        target_user = user.classify.constantize
        new_object = target_user.new
        column_iterator = -1
        target_user.column_names.each do |key|
          column_iterator += 1
          unless key == "ID"
            value = row[column_iterator]
            new_object.send "#{key}=", value
          end
        end
        new_object.save
      end
    end
  end
end