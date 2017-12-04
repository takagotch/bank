def who_bought
  @product = Product.find(params[:id])
  respond_to do |format|
    format.atom
  end
end

