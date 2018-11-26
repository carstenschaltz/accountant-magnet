require 'csv'

class LoadServicesJob < ApplicationJob
  queue_as :default

  def perform
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    filepath    = 'db/services.csv'

    CSV.foreach(filepath, csv_options) do |row|
      Service.create!(name: row['service']) unless Service.where(name: row['service']).any?
    end
  end
end

# Run:
# rails c
# LoadServicesJob.perform_now
