require 'json'
require 'net/http'

class APIS::Fastweb
	@@url = "http://scholarships.fastweb.com/r-african-american-students"

	attr_accessor :name, :deadline, :value
	def initialize(name = 'lucy', deadline = 'now', value = '2200.00')
		@name = name
		@deadline = deadline
		@value = value
	end
	
	def search_method(search)
		lookinto = "#{@@url}api/json/ondemand/search?#{search}"
		url = URI(lookinto)
		the_data = Net::HTTP.get(url)
		values = JSON.parse(the_data)
		p values
	end
	
end