class ApplicationController < ActionController::Base

  before_filter :require_login


  private 

  def require_login
  	unless session.has_key?(:gameID)
  		redirect_to '/login' unless request.fullpath == '/login'
  	end
  end
end
