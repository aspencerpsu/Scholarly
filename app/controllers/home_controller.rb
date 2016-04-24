class HomeController < ApplicationController
	def index

	end

	def mailto
		@new_message = APIS::Mailcarrier.new(params[:email][:address], params[:subject], params[:text])
	
		redirect_to :back
	end

	def lender
		@provider = Provider.new
	end
end
