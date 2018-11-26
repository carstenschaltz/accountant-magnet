require 'csv'

class ServicesJob < ApplicationJob
  queue_as :default

  def perform
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    filepath    = 'db/services.csv'
    i = 1
    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ["name"]
      Service.all.each do |service|
        csv << [service.name]
        puts "saved service #{i}"
        i += 1
      end
    end
  end
end

# Run:
# rails c
# ServicesJob.perform_now
