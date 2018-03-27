class Customer < ApplicationRecord
	after_create :send_message

    validates :name , presence:true
    validates :membership_number, presence:true
    
	validates :contact_number, numericality: { only_integer: true }, length: \
  { minimum: 10, maximum: 11 }, allow_blank: true
 
  def send_message
    require "rubygems"
    require "net/https"
    require "uri"
    require "json"
   
	uname = "sjorg.pune@gmail.com"
	hash = "42abd45a31bd7b1a04b8aefe9eecf52f5249af5291ec2980cf14d368cdaf8125"
    message = "Welcome to SJ Organization. #{self.name} Your membership Amt. #{self.amount} Received."
    numbers = self.contact_number
    sender = "TXTLCL" 
    requested_url = 'http://api.textlocal.in/send/?' + "username=" + uname + "&hash=" + hash + "&numbers=" + numbers + "&message=" + message + "&sender=" + sender
    uri = URI.parse(requested_url)
    http = Net::HTTP.start(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    res = http.request(request)
    response = JSON.parse(res.body)
    puts (response)
  end
  
  	
end