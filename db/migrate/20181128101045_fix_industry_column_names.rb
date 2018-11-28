class FixIndustryColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :accountants, :industries, :industries_string
    rename_column :enquiries, :industry, :industry_string
  end
end
