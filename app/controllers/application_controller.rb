class ApplicationController < ActionController::Base

  before_filter :require_login, :except => [:register]


  private 

  def require_login
  	unless session[:gameID]
  		redirect_to '/login' unless request.fullpath == '/login'
  	end
  end
end
