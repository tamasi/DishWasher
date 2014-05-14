class TurnToWashesController < ApplicationController
  before_action :set_turn_to_wash, only: [:show, :edit, :update, :destroy]

  # GET /turn_to_washes
  # GET /turn_to_washes.json
  def index
    @turn_to_washes = TurnToWash.all
  end

  # GET /turn_to_washes/1
  # GET /turn_to_washes/1.json
  def show
  end

  # GET /turn_to_washes/new
  def new
    @turn_to_wash = TurnToWash.new
  end

  # GET /turn_to_washes/1/edit
  def edit
  end

  # POST /turn_to_washes
  # POST /turn_to_washes.json
  def create
    @turn_to_wash = TurnToWash.new(turn_to_wash_params)
    @turn_to_wash.datename = @turn_to_wash.dateturn.strftime("%A")
    if @turn_to_wash.datename == "Saturday" or @turn_to_wash.datename == "Sunday"
      @turn_to_wash.is_weekend = true
    end
    @turn_to_wash.save
    respond_to do |format|
      if @turn_to_wash.save
        format.html { redirect_to @turn_to_wash, notice: 'Turn to wash was successfully created.' }
        format.json { render :show, status: :created, location: @turn_to_wash }
      else
        format.html { render :new }
        format.json { render json: @turn_to_wash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turn_to_washes/1
  # PATCH/PUT /turn_to_washes/1.json
  def update
    respond_to do |format|
      if @turn_to_wash.update(turn_to_wash_params)
        format.html { redirect_to @turn_to_wash, notice: 'Turn to wash was successfully updated.' }
        format.json { render :show, status: :ok, location: @turn_to_wash }
      else
        format.html { render :edit }
        format.json { render json: @turn_to_wash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turn_to_washes/1
  # DELETE /turn_to_washes/1.json
  def destroy
    @turn_to_wash.destroy
    respond_to do |format|
      format.html { redirect_to turn_to_washes_url, notice: 'Turn to wash was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turn_to_wash
      @turn_to_wash = TurnToWash.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def turn_to_wash_params
      params.require(:turn_to_wash).permit(:dateturn, :datename)
    end
end
