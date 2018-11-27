require 'csv'

class  LoadlatlongJob < ApplicationJob
   queue_as :default

   def perform
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    filepath    = 'db/accountantlatlong.csv'

    CSV.foreach(filepath, csv_options) do |row|
      Accountant.find(row['id']).update!(latitude: row["latitude"], longitude: row["longitude"])
    end
end

