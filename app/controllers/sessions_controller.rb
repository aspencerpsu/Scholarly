class SessionsController < ApplicationController
  def new
  	@student = Student.find_by(email: params[:email])
    @provider = Provider.find_by(email: params[:email])
  end

  def create
  	@student = Student.find_by(email: params[:email])
    @provider = Provider.find_by(email: params[:email])

  	if @student && @student.authenticate(params[:password])
      session[:student_id] = @student.id 
  		flash[:notice] = "You've sucessfully logged in!"
  		redirect_to @student
  	elsif @provider && @provider.authenticate(params[:password])
      session[:provider_id] = @provider.id
      flash[:notice] = "You've successfully logged in!"
      redirect_to @provider
    else
  		flash[:notice] = "Sorry that password is incorrect...try again small fry"
  		redirect_to root_path
  	end
  end

  def 
  def destroy
	session.clear
	flash[:notice] = "You've safely logout, until next"
	redirect_to root_path
  end
end
