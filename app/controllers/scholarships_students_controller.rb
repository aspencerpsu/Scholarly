class ScholarshipsStudentsController < ApplicationController
  def index
  end

  def create
  	@student = current_user
  	savethang = @student.build(params[:sh], params[:id]) 
  	if savethang.save
  		respond_to do |format|
  			format.html{redirect_to :back, :notice = "You're not following this scholarship anymore"}
  			format.js{}
  		end
  	else
  		flash[:notice] = "Sorry but I'm no longer able to confirm who you are..."
  	end
  end

  def destroy
  	@student = current_user
  	@student.followingfunds
  end
end
