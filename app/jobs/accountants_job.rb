
# CAUTION: This job should only be run if you've scraped the site into your DB.
# Running with production data will overwrite.

require 'csv'

class AccountantsJob < ApplicationJob
  queue_as :default

  def perform
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    filepath    = 'db/accountants.csv'
    i = 1
    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ["name", "email", "phone_number", "website", "qualification", "location", "industries"]
      Accountant.all.each do |accountant|
        csv << [accountant.name, accountant.email,
                accountant.phone_number,
                accountant.website,
                accountant.qualification,
                accountant.location,
                accountant.industries]
        puts "saved accountant #{i}"
        i += 1
      end
    end
  end
end

# Run:
# rails c
# AccountantsJob.perform_now

