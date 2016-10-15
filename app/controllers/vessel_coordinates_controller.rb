class VesselCoordinatesController < ApplicationController
  before_action :set_vessel_coordinate, only: [:show, :edit, :update, :destroy]

  # GET /vessel_coordinates
  # GET /vessel_coordinates.json
  def index
    @vessel_coordinates = VesselCoordinate.all
  end

  # GET /vessel_coordinates/1
  # GET /vessel_coordinates/1.json
  def show
  end

  # GET /vessel_coordinates/new
  def new
    @vessel_coordinate = VesselCoordinate.new
  end

  # GET /vessel_coordinates/1/edit
  def edit
  end

  # POST /vessel_coordinates
  # POST /vessel_coordinates.json
  def create
    @vessel_coordinate = VesselCoordinate.new(vessel_coordinate_params)

    respond_to do |format|
      if @vessel_coordinate.save
        format.html { redirect_to @vessel_coordinate, notice: 'Vessel coordinate was successfully created.' }
        format.json { render :show, status: :created, location: @vessel_coordinate }
      else
        format.html { render :new }
        format.json { render json: @vessel_coordinate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vessel_coordinates/1
  # PATCH/PUT /vessel_coordinates/1.json
  def update
    respond_to do |format|
      if @vessel_coordinate.update(vessel_coordinate_params)
        format.html { redirect_to @vessel_coordinate, notice: 'Vessel coordinate was successfully updated.' }
        format.json { render :show, status: :ok, location: @vessel_coordinate }
      else
        format.html { render :edit }
        format.json { render json: @vessel_coordinate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vessel_coordinates/1
  # DELETE /vessel_coordinates/1.json
  def destroy
    @vessel_coordinate.destroy
    respond_to do |format|
      format.html { redirect_to vessel_coordinates_url, notice: 'Vessel coordinate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vessel_coordinate
      @vessel_coordinate = VesselCoordinate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vessel_coordinate_params
      params.require(:vessel_coordinate).permit(:sensor_array_id, :vessel_id, :point, :point_accuracy, :heading, :speed, :altitude, :altitude_accuracy, :timestamp)
    end
end
