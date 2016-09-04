class UsersController < ApplicationController
  
  # GET /users/new
  def index
    if session.has_key?(:gameID)
      redirect_to '/play' 
    end
  end

# registers user with the API and draws the grid
  def register
	   	@userName = params[:userName]
	   	@emailAddress = params[:emailAddress]
      begin
      @responseDetails = BattleshipsAPI.register(@userName, @emailAddress)
        if @sessionDetailsID.is_a?(Object)
          session[:gameID] = @responseDetails["id"]
          session[:incomingX] = @responseDetails["x"];
          session[:incomingY] = @responseDetails["y"];
          redirect_to '/play', incomingX: @incomingX, incomingY: @incomingY 
        end        
        rescue SocketError => errorMsg
          flash[:error] = "Error communicating with #{BattleshipsAPI.base_uri}. Please check your connection and try again"
          redirect_to root_url        
      end
  end

  def logout 
    session[:gameID] = nil
    redirect_to root_url 
  end
end
