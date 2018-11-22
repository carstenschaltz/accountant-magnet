class AddIndustriesToAccountants < ActiveRecord::Migration[5.2]
  def change
    add_column :accountants, :industries, :string
  end
end
