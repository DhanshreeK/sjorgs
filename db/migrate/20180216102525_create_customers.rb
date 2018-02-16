class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :state
      t.string :pincode
      t.string :contact_number
      t.string :email
      t.string :amount

      t.timestamps
    end
  end
end
