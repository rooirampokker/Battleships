class UsersController < ApplicationController

  # GET /users/new
  def index
    
  end

# registers user with the API and draws the grid
  def register
    @userName = params[:userName]
    @emailAddress = params[:emailAddress]
    @grid = "draw Grid here"
  end 
end
