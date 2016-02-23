class SessionsController < ApplicationController
  def new
  	@student = Student.find_by(email: params[:email])
  end

  def create
  	@student = Student.find_by(email: params[:email])
  	if @student && @student.authenticate(params[:password])
  		flash[:notice] = "You've sucessfully logged in!"
  		redirect_to @student
  	else
  		flash[:notice] = "Sorry that password is incorrect...try again small fry"
  		redirect_to root_path
  	end
  end

  def destroy
	session.clear
	flash[:notice] = "You've safely logout, until next"
	redirect_to root_path
  end
end
