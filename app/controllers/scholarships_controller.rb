class ScholarshipsController < ApplicationController

  def index

  end

  def new
    @scholarship = Scholarship.new
    @provider = Provider.new
  end

  def show

  end

  def create
    @provider = current_provider
  	@providers_scholarship = Scholarship.new(scholarship_params)

    if @providers_scholarship.save
      @providers_scholarship.update(provider_id: @provider.id)
      flash[:notice] = "Successful new scholarship in under your watch"
      redirect_to :back
    else
      flash[:notice] = "Error Processing Your Request"
      redirect_to @provider
    end 
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
  private 
  def scholarship_params
    params.require(:scholarship).permit(:name, :scholarship, :value, :gpa, :deadline)
  end

  def remove
  	@student = current_user
    @scholarship = Scholarship.find(params[:id])
    @scholarship.delete
    redirect_to @student
  end

end
