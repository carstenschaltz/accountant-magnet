class AddCompanyNameToEnquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :enquiries, :company_name, :string
    add_column :enquiries, :company_reg, :string
    add_column :enquiries, :industry, :string
    add_column :enquiries, :size, :string
    add_column :enquiries, :location, :string
  end
end
