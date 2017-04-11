class Api::V1::SensorReadingsController < ApplicationController
  protect_from_forgery with: :null_session

  def new
    @sensor_readings = SensorReading.new
  end

  def create
    @sensor_types = SensorType.all
    return (render json: {sensor_type: ["no sensor readings included"]}, status: :unprocessable_entity) if included_sensor_types.empty?

    @sensor_array = SensorArray.find_by(handle: params['sensor_array'])
    return (render json: {sensor_array: ["there is no sensor array with '#{params['sensor_array']}' as a handle"]}, status: :unprocessable_entity) if @sensor_array.nil?

    @response = {}
    @response.default = []
    unknown_params.each {|up| @response[:errors].append({up => 'unknown_params'})}

    included_sensor_types.each do |sensor_type_handle|
      sensor_type = SensorType.find_by(handle: sensor_type_handle)
      sensor_readings = @sensor_array.sensor_readings.build(sensor_reading_params(sensor_type))

      if sensor_readings.save
        @response[sensor_readings.sensor_type.handle] = {status: 'saved', reading: sensor_readings.reading}
      else
        @response[sensor_readings.sensor_type.handle] = {status: 'not saved', 'errors' => sensor_readings.errors}
      end
    end

    render json: @response, status: :created
  end

  private
    def sensor_reading_params(sensor_type)
      input_params = params
      input_params[:reading] = params[sensor_type.handle]
      input_params[:sensor_array_id] = @sensor_array.id
      input_params[:sensor_type_id] = sensor_type.id
      input_params.permit(:reading, :sensor_array_id, :sensor_type_id)
    end

    def included_sensor_types
      sensor_types = @sensor_types.map {|e| e.handle }
      sensor_types & params.keys
    end

    def unknown_params
      params.keys - included_sensor_types - ["sensor_array", "format", "controller", "action"]
    end
end
