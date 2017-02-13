class WeatherReadingsController < ApplicationController
  before_action :set_weather_reading, only: [:show, :edit, :update, :destroy]

  # GET /weather_readings
  # GET /weather_readings.json
  def index
    @weather_readings = WeatherReading.all
  end

  # GET /weather_readings/1
  # GET /weather_readings/1.json
  def show
  end

  # GET /weather_readings/new
  def new
    @weather_reading = WeatherReading.new
  end

  # GET /weather_readings/1/edit
  def edit
  end

  # POST /weather_readings
  # POST /weather_readings.json
  def create
    @weather_reading = WeatherReading.new(weather_reading_params)

    respond_to do |format|
      if @weather_reading.save
        format.html { redirect_to @weather_reading, notice: 'Weather reading was successfully created.' }
        format.json { render :show, status: :created, location: @weather_reading }
      else
        format.html { render :new }
        format.json { render json: @weather_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weather_readings/1
  # PATCH/PUT /weather_readings/1.json
  def update
    respond_to do |format|
      if @weather_reading.update(weather_reading_params)
        format.html { redirect_to @weather_reading, notice: 'Weather reading was successfully updated.' }
        format.json { render :show, status: :ok, location: @weather_reading }
      else
        format.html { render :edit }
        format.json { render json: @weather_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weather_readings/1
  # DELETE /weather_readings/1.json
  def destroy
    @weather_reading.destroy
    respond_to do |format|
      format.html { redirect_to weather_readings_url, notice: 'Weather reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weather_reading
      @weather_reading = WeatherReading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weather_reading_params
      params.require(:weather_reading).permit(:temp, :humidity, :pressure, :sensor_array_id)
    end
end
