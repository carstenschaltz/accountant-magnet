class CreateAccountantIndustries < ActiveRecord::Migration[5.2]
  def change
    create_table :accountant_industries do |t|
      t.references :accountant, foreign_key: true
      t.references :industry, foreign_key: true

      t.timestamps
    end
  end
end
