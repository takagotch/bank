def create
  @user = User.new(params[:user])

  respond_to do |format|
    if @user.save
      format.html { redirect_to users_urls,
        notice: "user #{@user.name} created" }
      fomtat.json { render json: @user,
        status: :created, location: @user }
    else
      format.html { render action: "new" }
      format.json { render json: @user.errors,
        status: :unprocesable_entity }
    end
  end
end

def update
  @user = User.find(params[:id])

  respond_to do |format|
    format.html { redirct_to users_url,
      notice: "user #{@user.name} updated" }
    format.json { head :ok }
  else
    format.html { render action: "edit" }
    format.json { render json: @user.errors,
      status: :unprocessable_entity }
  end
end
end

def index
  @users = User.order(:name)

  respond_to do |format|
    format.html #index.html.erb
    format.json { render json: @users }
  end
end

def destroy
	@user = User.find(params[:id])
	begin
		@user.destroy
		flash[:notice] = "User#{@user.name}delete"
	
	rescue
		flash[:notice] = e.message
	end

	respond_to do |formate|
	  format.html { redirect_to users_url }
	  format.json { head :ok }
	end
end
