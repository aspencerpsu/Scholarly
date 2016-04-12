class ScholarshipsStudentsController < ApplicationController
  def index
    p "I am alive"
  end

  def new
  	
  end

  def show
    @student = current_user
    @deadline_order = Scholarship.where('gpa' <= @student.gpa.to_s).order('deadline')
    @amount_order =  Scholarship.where('gpa' <= @student.gpa.to_s).sort_by{|own| own.value.match(/\A\${1}/)? own.value.slice(0).to_f : own.value.to_f }
    @amount_rev = Scholarship.where('gpa' <= @student.gpa.to_s).reverse_order('value')
    @name_order = Scholarship.where('gpa' <= @student.gpa.to_s).order('name')
    @savethang = ScholarshipsStudent.new
    p "++++++++++++++++++++++++++++++++++++++++"
      respond_to do |layout|
        layout.js{}
      end
    p @deadline_order
    p "+++++++++++++++++++++++++++++++++++++++"
    p @amount_order
    p "+++++++++++++++++++++++++++++++++++++++"
    p @amount_rev
    p "+++++++++++++++++++++++++++++++++++++++"
    p @name_order
  end

  def create
    # @@i = 0
  	@val = Scholarship.find(params[:scholarship])
    @ind = params[:index]
  	@student = current_user
    @correct_date = @val.deadline.to_s.split[0]
    @sch_name = @val.name;
    @wday = @val.deadline.wday.to_s
    if @val.deadline < Date.today() && @val.deadline.month == Date.today.month
      @heuristic = " past"
      @month = "\scurrent-month"
      @together = "wday-"+@wday << @heuristic << @month
    elsif @val.deadline < Date.today() && @val.deadline.month < Date.today.month
      @heuristic = "\spast"
      @month = "\sprev-month"
      @together = "wday-"+@wday << @heuristic << @month
    elsif @val.deadline > Date.today() && @val.deadline.month > Date.today.month
      @heuristic = "\sfuture"
      @month = "\snext-month"
      @together = "wday-"+@wday << @heuristic << @month
    else 
      @heuristic = "\stoday"
      @month = "\scurrent-month"
      @together = "wday-"+@wday << @heuristic << @month
    end
  	@savethang = @student.followingfunds << @val
  		respond_to do |format|
  			format.js{}
  		end
  end

  def destroy
    # @@i = 0
    @student = current_user
  	@valor = Scholarship.find(params[:scholarship_id])
    @student.followingfunds
  	respond_to do |format|
  		format.js { }
  	end
    @student.followingfunds.delete(params[:scholarship_id])
  end
end
