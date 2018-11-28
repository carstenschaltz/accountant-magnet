class LoadIndustriesJob < ApplicationJob
  queue_as :default

  def perform
    INDUSTRIES.each do |industry|
      Industry.create!(name: industry)
    end

    Accountant.all.each do |accountant|
      next unless accountant.industries_string

      industry_array = accountant.industries_string.gsub(/ \(.*\)/, "").split(", ")
      industry_array.each do |name|
        AccountantIndustry.create!(accountant: accountant, industry: Industry.find_by(name: name))
      end
    end
  end
end

# Run:
# rails c
# LoadIndustriesJob.perform_now
