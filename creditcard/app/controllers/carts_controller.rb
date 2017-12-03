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


