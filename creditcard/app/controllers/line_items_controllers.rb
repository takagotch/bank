def create
  @cart = current_cart
  product = Product.find{params[:product_id]}
  @line_items = @cart.add_product(product.id)
  respond_to do |format|
    if @line_item.save
      format.html { redirect_to store_item }
      format.js
      format.json { render json: @line_item,
        status: :created, location: @line_item }
    else
      format.html { render action: "new" }
      format.json { render json: @line_item.errors,
        status: :unprocessable_entry }
    end
  end
end

