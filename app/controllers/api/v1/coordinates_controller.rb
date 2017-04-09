class Api::V1::CoordinatesController < ApplicationController
  protect_from_forgery with: :null_session

  def new
    @coordinate = Coordinate.new
  end

  def create
    return (render json: {sensor_array: ["missing sensor array"]}, status: :unprocessable_entity) if params['sensor_array'].blank?

    @sensor_array = SensorArray.find_by(handle: params['sensor_array'])
    return (render json: {sensor_array: ["there is no sensor array with '#{params['sensor_array']}' as a handle"]}, status: :unprocessable_entity) if @sensor_array.nil?

    @coordinate = @sensor_array.coordinates.build(coordinate_params)

    respond_to do |format|
      if @coordinate.save
        format.json { render :show, status: :created, coordinate: @coordinate }
      else
        format.json { render json: @coordinate.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def coordinate_params
      input_params = params.slice(:latitude, :longitude, :timestamp, :point_accuracy, :altitude, :altitude_accuracy, :heading, :speed)
      input_params[:sensor_array_id] = @sensor_array.id
      input_params.permit(:latitude, :longitude, :timestamp, :point_accuracy, :altitude, :altitude_accuracy, :heading, :speed, :sensor_array_id)
    end
end
