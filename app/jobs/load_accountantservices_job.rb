require 'csv'

class LoadAccountantservicesJob < ApplicationJob
  queue_as :default

  def perform
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    filepath    = 'db/accountantservices.csv'

    CSV.foreach(filepath, csv_options) do |row|
      AccountantService.create!(accountant_id: row['accountant_id'],
                                service_id: row['service_id'])
    end
  end
end

# Run:
# rails c
# LoadAccountantservicesJob.perform_now
