class UsersController < ApplicationController
  
  # GET /users/new
  def index
    
  end

# registers user with the API and draws the grid
  def register
   	#session[:userName] = params[:userName]
   	#session[:emailAddress] = params[:emailAddress]
   	if params.has_key?(:userName) && params.has_key?(:emailAddress)
	   	@userName = params[:userName]
	   	@emailAddress = params[:emailAddress]
   	
   		@options = BattleshipsAPI.register(@userName, @emailAddress)
   		session[:gameID] = @options['id']
   		@grid = @options
   		redirect_to '/play'    
   	else 
   		redirect_to '/'
   	end
   	
  end 
end
