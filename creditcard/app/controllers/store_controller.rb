class StoreController < ApplicationController
  skip before_filter :authorize
  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.latest
      @cart     = curent_cart
    end
#
#    latest      = Product.latest
#    fresh_when etag: latest, last_modified: lastest.created_at.utc
#    expires_in 10minutes, public: true
#  end
end

class SessionController < ApplicationController
  skip_before_filter :authorize
end

