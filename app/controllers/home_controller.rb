class HomeController < ApplicationController
	def index
	end
	def mailto
	end
	def lender
		@provider = Provider.new
	end
end
