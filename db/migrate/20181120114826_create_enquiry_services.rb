class CreateEnquiryServices < ActiveRecord::Migration[5.2]
  def change
    create_table :enquiry_services do |t|
      t.references :service, foreign_key: true
      t.references :enquiry, foreign_key: true

      t.timestamps
    end
  end
end
