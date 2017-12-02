def create
  @picture = Picture.new(params[:picture])  
  if @picture.save
    redirect_to(@picture)
  else
    render(action :new)
  end
end

def download
  @picture = Picture.find(params[:picture_id])
  send_date(@picture.data,
	    filename:   @picture.name,
	    type:       @picture.content_type,
	   disposition: "inline")
end

def show
  @picture = Picture.find(params[:id])
end

