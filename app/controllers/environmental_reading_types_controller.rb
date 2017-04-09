class EnvironmentalReadingTypesController < ApplicationController
  before_action :set_environmental_reading_type, only: [:show, :edit, :update, :destroy]

  # GET /environmental_reading_types
  # GET /environmental_reading_types.json
  def index
    @environmental_reading_types = EnvironmentalReadingType.all
  end

  # GET /environmental_reading_types/1
  # GET /environmental_reading_types/1.json
  def show
  end

  # GET /environmental_reading_types/new
  def new
    @environmental_reading_type = EnvironmentalReadingType.new
  end

  # GET /environmental_reading_types/1/edit
  def edit
  end

  # POST /environmental_reading_types
  # POST /environmental_reading_types.json
  def create
    @environmental_reading_type = EnvironmentalReadingType.new(environmental_reading_type_params)

    respond_to do |format|
      if @environmental_reading_type.save
        format.html { redirect_to @environmental_reading_type, notice: 'Environmental reading type was successfully created.' }
        format.json { render :show, status: :created, location: @environmental_reading_type }
      else
        format.html { render :new }
        format.json { render json: @environmental_reading_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /environmental_reading_types/1
  # PATCH/PUT /environmental_reading_types/1.json
  def update
    respond_to do |format|
      if @environmental_reading_type.update(environmental_reading_type_params)
        format.html { redirect_to @environmental_reading_type, notice: 'Environmental reading type was successfully updated.' }
        format.json { render :show, status: :ok, location: @environmental_reading_type }
      else
        format.html { render :edit }
        format.json { render json: @environmental_reading_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /environmental_reading_types/1
  # DELETE /environmental_reading_types/1.json
  def destroy
    @environmental_reading_type.destroy
    respond_to do |format|
      format.html { redirect_to environmental_reading_types_url, notice: 'Environmental reading type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_environmental_reading_type
      @environmental_reading_type = EnvironmentalReadingType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def environmental_reading_type_params
      params.require(:environmental_reading_type).permit(:handle)
    end
end
