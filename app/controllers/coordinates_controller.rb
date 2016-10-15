class CoordinatesController < ApplicationController
  before_action :set_coordinate, only: [:show, :edit, :update, :destroy]

  # GET /coordinates
  # GET /coordinates.json
  def index
    @coordinates = Coordinate.all
  end

  # GET /coordinates/1
  # GET /coordinates/1.json
  def show
  end

  # GET /coordinates/new
  def new
    @coordinate = Coordinate.new
  end

  # GET /coordinates/1/edit
  def edit
  end

  # POST /coordinates
  # POST /coordinates.json
  def create
    @coordinate = Coordinate.new(coordinate_params)

    respond_to do |format|
      if @coordinate.save
        format.html { redirect_to @coordinate, notice: 'Vessel coordinate was successfully created.' }
        format.json { render :show, status: :created, location: @coordinate }
      else
        format.html { render :new }
        format.json { render json: @coordinate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coordinates/1
  # PATCH/PUT /coordinates/1.json
  def update
    respond_to do |format|
      if @coordinate.update(coordinate_params)
        format.html { redirect_to @coordinate, notice: 'Vessel coordinate was successfully updated.' }
        format.json { render :show, status: :ok, location: @coordinate }
      else
        format.html { render :edit }
        format.json { render json: @coordinate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coordinates/1
  # DELETE /coordinates/1.json
  def destroy
    @coordinate.destroy
    respond_to do |format|
      format.html { redirect_to coordinates_url, notice: 'Vessel coordinate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coordinate
      @coordinate = Coordinate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coordinate_params
      params.require(:coordinate).permit(:sensor_array_id, :latitude, :longitude, :point_accuracy, :heading, :speed, :altitude, :altitude_accuracy, :timestamp)
    end
end
