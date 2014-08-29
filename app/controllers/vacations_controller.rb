class VacationsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    @vacation = RemoveUserFromTurnList.new(current_user, params[:start_date], params[:end_date]).perform

    respond_to do |format|
        format.html { redirect_to edit_user_registration_path, notice: 'Vacation Granted.' }
    end
  end



end