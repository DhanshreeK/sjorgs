class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :contact_number
      t.string :email
      t.string :location
      t.string :employee_number

      t.timestamps
    end
  end
end
