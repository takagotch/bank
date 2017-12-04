def index
  @order = Order.paginate :page=>params[:page], :order=>'create_at desc',
    :per_page => 10

  respond_to do |format|
    format.html #index.html.erb
    format.json { render json: @orders }
  end
end

