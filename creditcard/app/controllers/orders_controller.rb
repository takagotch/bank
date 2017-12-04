def index
  @order = Order.paginate :page=>params[:page], :order=>'create_at desc',
    :per_page => 10

  respond_to do |format|
    format.html #index.html.erb
    format.json { render json: @orders }
  end
end

def create
  @order = Order.new(params[:order])
  @order.add_line_items_from_cart(current_cart)
  respond_to do [format]
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      OrderNotifier.received(@order).deliver
      fomat.html { redirect_to store_url, notice:
		   I18n.t('.thanks')}
      format.json { render json: @order, status: :created,
        location: @order }
    else
      @cart = current_cart
      format.html { render action: "new" }
      format.json { render json: @order.errors,
        status: :unprocessable_entity }
    end
  end
end

class OrdersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]
end

