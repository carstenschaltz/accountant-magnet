class CreateEnquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :enquiries do |t|
      t.string :title
      t.text :description
      t.boolean :is_local
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
