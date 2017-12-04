class ApplicationController < ActionController::Base
  before_filter :authorize

  private
  def authorize
	  unless User.find_by_id(session[:user_id])
            redirect_to login_url, notice: "Login"
	  end
  end

end

