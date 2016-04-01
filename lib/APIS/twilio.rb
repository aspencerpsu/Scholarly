require 'twilio-ruby' 

class BasicInstructions
	attr_accessor :title, :deadline, :content, :number, :value, :auth_token

	def initialize(title, name, deadline, number, value)
		@title = title
		@deadline = deadline
		@number = number
		@value = value
	end

	def new_message(title, name, deadline, number, value)
		# put your own credentials here 
		account_sid = 'AC4a48a89c14afa33a4de4ed30cd2cf692' 
		@auth_token = ENV['TWILIO_NUMBER']
		 
		# set up a client to talk to the Twilio REST API 
		@client = Twilio::REST::Client.new(account_sid, auth_token)
		 
		@client.account.messages.create({
			:from => '+12016854549', 
			:to =>  '+18457292151', 
			:body => 'URGENT THIS IS THE LAWYER CALLING TO TELL YOU THE HOUSE HAS BEEN REVOKED
						WE CAN NO LONGER SERVICE THE HOUSE AND THE TENANTS HAVE DECIDED TO MOVE ON 
						TO SOMEONE',  
		})
	end
end