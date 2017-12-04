def new
  @cart = current_cart
  if @cart.line_items.empty?
    redirect_to store_url, notice: "empty carts"
    return
end

@order = Order.new

respond_to do |format|
  format.html #new.html.erb
  format.json { render json: @order }
  end
end

def create
  @order = Order.new(params[:order])
  @order.add_line_items_form_cart(current_cart)

  respond_to do |format|
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      format.html { redirect_to store_url, notice:
        'Thx for orders' }
      format.json { render json: @order, status: :created,
        location: @order }
    else
      @cart = current_cart
      format.html { render action: "new" }
      format.json { render json: @order.errros,
        status: :unprocessable_entity }
    end
  end
end

