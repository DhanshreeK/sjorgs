json.extract! customer, :id, :name, :address1, :address2, :state, :pincode, :contact_number, :email, :amount, :created_at, :updated_at
json.url customer_url(customer, format: :json)
