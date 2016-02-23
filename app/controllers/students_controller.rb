class StudentsController < ApplicationController

  def index
    @student = Student.all 
    # select users who have the same interest of scholarships and have the same grade and age as yourself
    # must present an intense amount scholarships they have applied to in the past and gear around the same path
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params_new)
    if @student.save
      session[:student_id] = @student.id
      flash[:notice] = "Congratulations, welcome to your first time at scholarly"
      redirect_to @student
    else
      flash[:notice] = "I'm sorry but we couldn't create an account for you"
      render root_path
    end
  end

  def destroy
    if @student
      @student.delete
      session.clear
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def more

  end

  def show
    @student = current_user
  end
  private
  def student_params_new
    params.require(:student).permit(:name, :email, :password, :phone, :gender)
  end

  private
  def student_params_edit
    params.require(:student).permit(:zip, :address1, :address2, :home, :identity, :location)
  end

  private
  def student_params_more
    params.require(:student).permit(:activities, :gpa, :majors, :college)
  end
end
