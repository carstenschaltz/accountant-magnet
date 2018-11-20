class CreateAccountantServices < ActiveRecord::Migration[5.2]
  def change
    create_table :accountant_services do |t|
      t.references :service, foreign_key: true
      t.references :accountant, foreign_key: true

      t.timestamps
    end
  end
end
