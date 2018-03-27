class AddColumnToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :membership_number, :string
  end
end
