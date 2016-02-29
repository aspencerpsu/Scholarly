class ScholarshipsController < ApplicationController
  def index
  end

  def show
  end

  def create
  	
  end

  def instance

  end
  def follow
  	@student = current_user
  	@scholarship = Scholarship.find(params[:id])
  	@myfavs = ScholarshipsStudent.new(student_id: @student.id, scholarship_id: params[:id])
  	if @myfavs.save
	  	respond_to do |quick|
	  		flash[:notice] = "You are now keeping track of this scholarship, please remember the deadline of this scholarship"
	  		quick.js {}
	  	end
  		# redirect_to @student
  	end
  end

  def remove
  	@student = current_user
  	@scholarship = Scholarship.find(params[:id])
  	@scholarship.delete
  	redirect_to @student
  end
end
