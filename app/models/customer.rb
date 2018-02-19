class Customer < ApplicationRecord
	after_save :send_message

    validates :name , presence:true
    
	validates :contact_number, numericality: { only_integer: true }, length: \
  { minimum: 10, maximum: 11 }, allow_blank: true
 
  def send_message
  		require "rubygems"
		require "net/https"
		require "uri"
		require "json"
		uname = "sjorg.pune@gmail.com"
		hash = "1b907efdc9b6661c4896ef71a44f3c6a191563b7632eea36f59b8cbcfb78899e"
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