class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.boolean :successful
      t.boolean :invite
      t.text :message
      t.references :enquiry, foreign_key: true
      t.references :accountant, foreign_key: true
      t.references :user, through: :enquiries
      t.timestamps
    end
  end
end
