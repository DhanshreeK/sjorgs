json.extract! employee, :id, :name, :email, :contact_number, :location, :created_at, :updated_at
json.url employee_url(employee, format: :json)
