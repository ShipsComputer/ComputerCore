class SensorArraysController < ApplicationController
  before_action :set_sensor_array, only: [:show, :edit, :update, :destroy]

  # GET /sensor_arrays
  # GET /sensor_arrays.json
  def index
    @sensor_arrays = SensorArray.all
  end

  # GET /sensor_arrays/1
  # GET /sensor_arrays/1.json
  def show
  end

  # GET /sensor_arrays/new
  def new
    @sensor_array = SensorArray.new
  end

  # GET /sensor_arrays/1/edit
  def edit
  end

  # POST /sensor_arrays
  # POST /sensor_arrays.json
  def create
    @sensor_array = SensorArray.new(sensor_array_params)

    respond_to do |format|
      if @sensor_array.save
        format.html { redirect_to @sensor_array, notice: 'Sensor array was successfully created.' }
        format.json { render :show, status: :created, location: @sensor_array }
      else
        format.html { render :new }
        format.json { render json: @sensor_array.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sensor_arrays/1
  # PATCH/PUT /sensor_arrays/1.json
  def update
    respond_to do |format|
      if @sensor_array.update(sensor_array_params)
        format.html { redirect_to @sensor_array, notice: 'Sensor array was successfully updated.' }
        format.json { render :show, status: :ok, location: @sensor_array }
      else
        format.html { render :edit }
        format.json { render json: @sensor_array.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sensor_arrays/1
  # DELETE /sensor_arrays/1.json
  def destroy
    @sensor_array.destroy
    respond_to do |format|
      format.html { redirect_to sensor_arrays_url, notice: 'Sensor array was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor_array
      @sensor_array = SensorArray.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sensor_array_params
      params.require(:sensor_array).permit(:name, :vessel_id, :location)
    end
end
