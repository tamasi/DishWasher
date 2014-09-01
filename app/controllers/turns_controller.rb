class TurnsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :rotate_turn_with_next_washer]
  before_action :set_turn, only: [:show, :edit, :update, :destroy]
  before_action :check_organization, only: [:index]
  has_scope :from_date
  has_scope :to_date
  # GET /turns
  # GET /turns.json
  def index
    #@turns = Turn.from_date.limit(7)
    @turns = Turn.for_organization(current_user.organization).from_current_date
  end

  # GET /turns/1
  # GET /turns/1.json
  def show
  end

  # GET /turns/new
  def new
    @turn = Turn.new
  end

  # GET /turns/1/edit
  def edit
  end

  # POST /turns
  # POST /turns.json
  def create
    @turn = Turn.new(turn_params)

    respond_to do |format|
      if @turn.save
        format.html { redirect_to @turn, notice: 'Turn wash successfully created.' }
        format.json { render :show, status: :created, location: @turn }
      else
        format.html { render :new }
        format.json { render json: @turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turns/1
  # PATCH/PUT /turns/1.json
  def update
    respond_to do |format|
      if @turn.update(turn_params)
        format.html { redirect_to @turnh, notice: 'Turn wash successfully updated.' }
        format.json { render :show, status: :ok, location: @turn }
      else
        format.html { render :edit }
        format.json { render json: @turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turns/1
  # DELETE /turns/1.json
  def destroy
    @turn.destroy
    respond_to do |format|
      format.html { redirect_to turns_url, notice: 'Turn wash successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #get /generate_turns
  def generate_turns
      team       = User.from_organization(current_user.organization)
      start_date = Time.now.to_date

      ::GenerateTurns.new(team, start_date).perform
      redirect_to turns_path
  end

  def regenerate_turns
    team       = User.from_organization(current_user.organization)
    start_date = Time.now.to_date

    ::RegenerateTurns.new(team, start_date).perform
    redirect_to turns_path
  end

  def vacation_request_new
    @vacation_param = ::Vacation.new( current_user, start_vacation, end_vacation )
  end

  def vacation_request
    user = current_user
    ::Vacation.new(user, start_vacation, end_vacation).perform
  end

  def rotate_turn_with_next_washer
    user = current_user
    ::RotateTurnWithNextWasher.new(user).perform
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turn
      @turn = Turn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def turn_params
      params.require(:turn).permit(:date_turn, :user_id, :miss)
    end

    def check_organization
      if current_user.organization_id == nil and current_user.is_admin == true
        redirect_to new_organization_path
      end
    end

    def check_team
      
    end
end
