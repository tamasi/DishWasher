class AdminsController < ApplicationController
	
	before_action :authenticate_admin!

	def index
		@team = User.from_organization(current_user.organization)
	end
	def new
		@team = User.new
	end

	def edit
		
	end
	
	def create
		@team = User.new(user_params)
    	@team.is_admin = false
    	@team.organization_id = current_user.organization_id
    	@team.save
    	respond_to do |format|
    	  if @team.save
    	    format.html { redirect_to admins_path, notice: 'New member was successfully created.' }
    	  else
    	    format.html { render action: 'new' }
    	  end
    	end
	end

	def update
	    respond_to do |format|
		    if @team.update(user_params)
		      format.html { redirect_to @team, notice: 'Organization was successfully updated.' }
		      format.json { render :show, status: :ok, location: @team }
		    else
		      format.html { render :edit }
		      format.json { render json: @team.errors, status: :unprocessable_entity }
		    end
	    end
  	end

  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to admins_path, notice: 'Member was successfully deleted.' }
    end
  end

  	private
    	def user_params
    		params.require(:user).permit(:username, :email, :password, :password_confirmation)
    	end
end