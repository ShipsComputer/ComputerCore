class SensorReadingsController < ApplicationController
  before_action :set_sensor_reading, only: [:show, :edit, :update, :destroy]

  # GET /sensor_readings
  # GET /sensor_readings.json
  def index
    @sensor_readings = SensorReading.all
  end

  # GET /sensor_readings/1
  # GET /sensor_readings/1.json
  def show
  end

  # GET /sensor_readings/new
  def new
    @sensor_reading = SensorReading.new
  end

  # GET /sensor_readings/1/edit
  def edit
  end

  # POST /sensor_readings
  # POST /sensor_readings.json
  def create
    @sensor_reading = SensorReading.new(sensor_reading_params)

    respond_to do |format|
      if @sensor_reading.save
        format.html { redirect_to @sensor_reading, notice: 'Sensor reading was successfully created.' }
        format.json { render :show, status: :created, location: @sensor_reading }
      else
        format.html { render :new }
        format.json { render json: @sensor_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sensor_readings/1
  # PATCH/PUT /sensor_readings/1.json
  def update
    respond_to do |format|
      if @sensor_reading.update(sensor_reading_params)
        format.html { redirect_to @sensor_reading, notice: 'Sensor reading was successfully updated.' }
        format.json { render :show, status: :ok, location: @sensor_reading }
      else
        format.html { render :edit }
        format.json { render json: @sensor_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sensor_readings/1
  # DELETE /sensor_readings/1.json
  def destroy
    @sensor_reading.destroy
    respond_to do |format|
      format.html { redirect_to sensor_readings_url, notice: 'Sensor reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor_reading
      @sensor_reading = SensorReading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sensor_reading_params
      params.require(:sensor_reading).permit(:reading, :sensor_type_id, :sensor_array_id)
    end
end
