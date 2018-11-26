require 'csv'

class AccountantservicesJob < ApplicationJob
  queue_as :default

  def perform
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    filepath    = 'db/accountantservices.csv'
    i = 1
    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ['accountant_id', 'subservice_name', 'service_name']
      AccountantService.all.each do |accountantservice|
        csv << [accountantservice.accountant_id, accountantservice.service.name, SERVICE_MAP[accountantservice.service.name]]
        puts "saved accountantservice #{i}"
        i += 1
      end
    end
  end
end

# Run:
# rails c
# AccountantservicesJob.perform_now
