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
    @j_tab = ScholarshipsStudent.find_by(scholarship_id: params[:scholarship_id], student_id: @student.id)
  	@student.followingfunds.delete(params[:scholarship_id])
  	respond_to do |format|
      format.html{ render 'students/show', :locals => {:val => @val, :i => @i}}
  		format.js{@val = Scholarship.find(params[:scholarship_id])}
  	end
  end
end
