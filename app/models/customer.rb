class Customer < ApplicationRecord
    require 'roo'
	after_create :send_message
  validates :name , presence:true
  validates :membership_number, presence:true
	validates :contact_number, presence: true
 
  def send_message
    require "rubygems"
    require "net/https"
    require "uri"
    require "json"
   
	uname = "sjorg.pune@gmail.com"
    hash = "pqyQynKQv7E-0XwgBO6g6FlMiNosDUam7v0me84l3i"
    message = "Welcome to SJ Organization. #{self.name} Your Membership Amt. #{self.amount} Received. Your Membership Number is #{self.membership_number}."
    numbers = "#{self.contact_number}"
    sender = "SJOIND" 
    requested_url = 'http://api.textlocal.in/send/?' + "apikey=" + hash + "&numbers=" + numbers + "&message=" + message + "&sender=" + sender
    uri = URI.parse(requested_url)
    http = Net::HTTP.start(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    res = http.request(request)
    response = JSON.parse(res.body)
    puts (response)
  end
  
  

def self.to_csv(options = {})
   CSV.generate(options) do |csv|
     csv << column_names
     all.each do |invoice|
       csv << invoice.attributes.values_at(*column_names)
     end
   end
 end
#def self.import(file)
 # CSV.foreach(file.path, headers: true) do |row|
  #  Customer.create! row.to_hash
  #end
#end


def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    customer = find_by_id(row["id"]) || new
    customer.attributes = row.to_hash
    customer.save!
  end
end



def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when '.csv' then Roo::Csv.new(file.path,packed: false,file_warning: :ignore)
  when '.xls' then Roo::Excel.new(file.path,packed: false,file_warning: :ignore)
  when '.xlsx' then Roo::Excelx.new(file.path,packed: false,file_warning: :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end
end