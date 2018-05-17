class Employee < ApplicationRecord
 	after_save :create_user_account

   validates :email, presence: true, format: \
  { with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/ }

   validates :contact_number, numericality: { only_integer: true }, length: \
  { minimum: 10, maximum: 11 }, allow_blank: true

  validates :name , presence:true

  has_attached_file :photo,style: { thumb: '120x120', small: '250x250' },
                  :url  => "/assets/employees/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/employees/:id/:style/:basename.:extension"


  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png','image/jpg']

	#creates new user account
	def create_user_account
		User.create!(email: self.email, password: self.employee_number,role: 'Employee',employee_id: self.id)
	end

	def self.set_employee_number
    date = Date.today.strftime('%Y%m%d')
    if Employee.first.nil?
      'EMP' + date.to_s + '1'
    else
      last_id = Employee.last.id.next
      'EMP' + date.to_s + last_id.to_s
    end
  end
end
