class CreateAccountants < ActiveRecord::Migration[5.2]
  def change
    create_table :accountants do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.text :bio
      t.string :location

      t.timestamps
    end
  end
end
