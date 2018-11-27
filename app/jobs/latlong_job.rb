require 'csv'

class LatlongJob< ApplicationJob
  queue_as :default

  def perform
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    filepath    = 'db/accountantlatlong.csv'
    i = 1
    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ["id", "latitude", "longitude"]
      Accountant.all.each do |accountant|
        csv << [accountant.id, accountant.latitude, accountant.longitude]
        puts "saved accountant lat and long #{i}"
        i += 1
      end
    end
  end
end

# Run:
# rails c
# LatlongJob.perform_now
