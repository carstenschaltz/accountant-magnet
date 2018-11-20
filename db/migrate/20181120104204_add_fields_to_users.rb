class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :company_industry, :string
    add_column :users, :company_name, :string
    add_column :users, :company_size, :string
    add_column :users, :company_location, :string
  end
end
