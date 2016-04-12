class ProvidersController < ApplicationController
  def index
  end

  def new
  	@provider = Provider.new
  end

  def create
  	@provider = Provider.new(provider_params)
  	if @provider.save
      session[:provider_id] = @provider.id
  		flash[:notice] = "Welcome To ScholarAPPtitude".concat(@provider.title)
  		redirect_to @provider
  	else
  		flash[:notice] = "Whoops, looks like you couldn't create an account with us, Please try again"
  		redirect :back
  	end
  end

  def show
    @providers_scholarship = Scholarship.new
    @provider = current_provider
    ActiveSupport::Cache::MemCacheStore.new("localhost")
  end

  private
  def provider_params
  	params.require(:provider).permit(:industry, :title, :password, :email)
  end
end
