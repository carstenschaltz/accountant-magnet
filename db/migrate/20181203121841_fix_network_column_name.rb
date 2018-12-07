class FixNetworkColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :enquiries, :closed, :network
  end
end
