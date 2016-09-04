class BattleshipsController < ApplicationController

  # GET /play
  def index
    @grid = "draw grid here"
  end

  def nuke
  	@gameID = params[:id]
  	@xCoord = params[:x]
  	@yCoord = params[:y]
      begin
      	@responseDetails = BattleshipsAPI.nuke(@gameID, @xCoord,@yCoord)
        rescue SocketError => errorMsg
          flash[:error] = "Error communicating with #{BattleshipsAPI.base_uri}. Please check your connection and try again"
          #redirect_to root_url        
      end  	
  	respond_to do |format|
  		format.html
  		format.json {render :json => @responseDetails}
  	end
  end
end
