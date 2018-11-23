require 'csv'

class LoadAccountantsJob < ApplicationJob
  queue_as :default

  def perform
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    filepath    = 'db/accountants.csv'

    CSV.foreach(filepath, csv_options) do |row|
      Accountant.create!(name: row['name'],
                         email: row['email'],
                         phone_number: row['phone_number'],
                         website: row['website'],
                         qualification: row['qualification'],
                         location: row['location'],
                         industries: row['industries'])
    end
  end
end

# Run:
# rails c
# LoadAccountantsJob.perform_now
