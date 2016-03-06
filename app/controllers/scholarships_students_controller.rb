class ScholarshipsStudentsController < ApplicationController
  def index

  end

  def new
  	
  end

  def create
    @i = 0
  	@val = Scholarship.find(params[:scholarship])
  	@student = current_user
  	@savethang = @student.followingfunds << @val
  		respond_to do |format|
  			format.js{}
  		end
  end

  def destroy
    @i = 0
    @student = current_user
  	@val = Scholarship.find(params[:scholarship_id])
  	@student.followingfunds.delete(params[:scholarship_id])
  	respond_to do |format|
  		format.js{ :locals => {@val = Scholarship.find(params[:scholarship_id])} }
  	end
  end
end
