class VacationsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create

    if params[:username] == nil
      @vacation = RemoveUserFromTurnList.new(current_user, params[:start_date], params[:end_date]).perform
    else
      user = User.find_by(username: params[:username])
      @vacation = RemoveUserFromTurnList.new(user, params[:start_date], params[:end_date]).perform
    end
    respond_to do |format|
        format.html { redirect_to edit_user_registration_path, notice: 'Vacation Granted.' }
    end

  end



end