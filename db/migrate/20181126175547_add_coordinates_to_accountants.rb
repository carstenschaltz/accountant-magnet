class AddCoordinatesToAccountants < ActiveRecord::Migration[5.2]
  def change
    add_column :accountants, :latitude, :float
    add_column :accountants, :longitude, :float
  end
end
