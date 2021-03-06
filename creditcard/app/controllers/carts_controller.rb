#
#

def show
  begin
    @cart = Cart.find(params[:id])
  rescue
    logger.error "invalided carts #{params[:id]} existed."
    redirect_to store_url, notice: 'invalidaed carts'
  else
    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @cart }
    end
  end
end

def destroy
  @cart = current_cart
  @cart.destroy
  session[:cart_id] = nil
  respond_to do |format|
    format.html { redirect_to store_url }
    format.json { head :ok }
  end
end

class CartsController < ApplicationController
  skip_before_filter :authorize, only: [:create, :update, :destroy]
end

