class EnvironmentalReadingsController < ApplicationController
  before_action :set_environmental_reading, only: [:show, :edit, :update, :destroy]

  # GET /environmental_readings
  # GET /environmental_readings.json
  def index
    @environmental_readings = EnvironmentalReading.all
  end

  # GET /environmental_readings/1
  # GET /environmental_readings/1.json
  def show
  end

  # GET /environmental_readings/new
  def new
    @environmental_reading = EnvironmentalReading.new
  end

  # GET /environmental_readings/1/edit
  def edit
  end

  # POST /environmental_readings
  # POST /environmental_readings.json
  def create
    @environmental_reading = EnvironmentalReading.new(environmental_reading_params)

    respond_to do |format|
      if @environmental_reading.save
        format.html { redirect_to @environmental_reading, notice: 'Environmental reading was successfully created.' }
        format.json { render :show, status: :created, location: @environmental_reading }
      else
        format.html { render :new }
        format.json { render json: @environmental_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /environmental_readings/1
  # PATCH/PUT /environmental_readings/1.json
  def update
    respond_to do |format|
      if @environmental_reading.update(environmental_reading_params)
        format.html { redirect_to @environmental_reading, notice: 'Environmental reading was successfully updated.' }
        format.json { render :show, status: :ok, location: @environmental_reading }
      else
        format.html { render :edit }
        format.json { render json: @environmental_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /environmental_readings/1
  # DELETE /environmental_readings/1.json
  def destroy
    @environmental_reading.destroy
    respond_to do |format|
      format.html { redirect_to environmental_readings_url, notice: 'Environmental reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_environmental_reading
      @environmental_reading = EnvironmentalReading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def environmental_reading_params
      params.require(:environmental_reading).permit(:reading, :environmental_reading_type_id, :sensor_array_id)
    end
end
