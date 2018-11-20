class AddEmailToEnquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :enquiries, :email, :string
  end
end
