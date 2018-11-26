require 'csv'

class LoadAccountantservicesJob < ApplicationJob
  queue_as :default

  def perform
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    filepath    = 'db/accountantservices.csv'

    CSV.foreach(filepath, csv_options) do |row|
      service = Service.find_by(name: row['service_name'])
      if AccountantService.where(accountant_id: row['accountant_id'], service: service).none?
        AccountantService.create!(accountant_id: row['accountant_id'], service: service)
      end
    end
  end
end

# Run:
# rails c
# LoadAccountantservicesJob.perform_now
