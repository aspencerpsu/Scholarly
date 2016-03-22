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
    @student = current_user
    if @student 
      flash[:notice] = 'We appreciate the time you\'ve spent with scholarships'
      @student.delete
      session.clear
      redirect_to root_path
    else
      flash[:notice] = "We've retained your credentials"
      render :show
    end
  end

  def terminate
    @user = current_user
    respond_to do |u|
      u.js{}
    end
  end

  def edit
    @student = Student.find_by(id: session[:student_id])
  end

  def update
    @student = Student.find_by(id: session[:student_id])
    @student.update(student_params_edit)
    if @student.save
      flash[:notice] = "I saved a few of your attributes"
      redirect_to @student
    else
      flash[:notice] = "I couldn't get a chance to save most of your stuff"
      render :edit
    end
  end

  def more
    
  end

  def show
    @student = current_user
    @scholarships = Scholarship.where('gpa' <= @student.gpa.to_s); 
    @events = @student.followingfunds.all
    @savethang = ScholarshipsStudent.new
  end

  private
  def student_params_new
    params.require(:student).permit(:name, :email, :password, :phone, :gender)
  end

  private
  def student_params_edit
    params.require(:student).permit(:zip, :address1, :address2, :home, :indentity, :location, :cell, :gpa)
  end

  private
  def student_params_more
    params.require(:student).permit(:activities, :majors, :college)
  end
end
