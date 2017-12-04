class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :set_i18n_locale_from_params

  private
  def authorize
	  unless User.find_by_id(session[:user_id])
            redirect_to login_url, notice: "Login"
	  end
  end

  def set_i18n_locale_from_params
      if params[:locale]
	      if I18n.available_locales.include?(params[:locale].to_sym)
	        I18n.locale = params[:locale]
	      else
	        flash.now[:notice] =
			"#{params[:locale]} translation not available"
		logger.error flash.now[:notice]
	      end
    end

    def default_url_option
      { locale: I18n.locale }
    end

end

