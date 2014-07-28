class Admin::UsersController < Admin::BaseController

  before_filter :find_user, except: [:index, :new, :create]

  def index
    @team = User.from_organization(current_user.organization)
  end

  def new
    @team = User.new
  end

  def edit
    
  end
  
  def create
    team = User.new(user_params)
      team.is_admin = false
      team.organization_id = current_user.organization_id
      team.save
      recalc_team_turns = User.from_organization(current_user.organization)
      start_date        = Time.now.to_date
      ::RegenerateTurns.new(recalc_team_turns, start_date).perform
      respond_to do |format|
        if team.save
          format.html { redirect_to admin_users_path, notice: 'New member was successfully created.' }
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
    @user.destroy

    recalc_team_turns = User.from_organization(current_user.organization)
    start_date        = Time.now.to_date
    ::RegenerateTurns.new(recalc_team_turns, start_date).perform

    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'Member was successfully deleted.' }
    end
  end

  protected
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def find_user
      @user = User.find(params[:id])
    end
end