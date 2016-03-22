class ScholarshipsStudentsController < ApplicationController
  def index

  end

  def new
  	
  end

  def create
    # @@i = 0
  	@val = Scholarship.find(params[:scholarship]);
  	@student = current_user
    @correct_date = @val.deadline.to_s.split[0];
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
