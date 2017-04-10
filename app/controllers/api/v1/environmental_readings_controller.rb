class Api::V1::EnvironmentalReadingsController < ApplicationController
  protect_from_forgery with: :null_session

  def new
    @environmental_reading = EnvironmentalReading.new
  end

  def create
    @environmental_reading_types = EnvironmentalReadingType.all
    return (render json: {environmental_reading_type: ["no environmental readings included"]}, status: :unprocessable_entity) if included_environmental_reading_types.empty?

    @sensor_array = SensorArray.find_by(handle: params['sensor_array'])
    return (render json: {sensor_array: ["there is no sensor array with '#{params['sensor_array']}' as a handle"]}, status: :unprocessable_entity) if @sensor_array.nil?

    @response = {}
    @response.default = []
    unknown_params.each {|up| @response[:errors].append({up => 'unknown_params'})}

    included_environmental_reading_types.each do |environmental_reading_type_handle|
      environmental_reading_type = EnvironmentalReadingType.find_by(handle: environmental_reading_type_handle)
      environmental_reading = @sensor_array.environmental_readings.build(environmental_reading_params(environmental_reading_type))

      if environmental_reading.save
        @response[environmental_reading.environmental_reading_type.handle] = {status: 'saved', reading: environmental_reading.reading}
      else
        @response[environmental_reading.environmental_reading_type.handle] = {status: 'not saved', 'errors' => environmental_reading.errors}
      end
    end

    render json: @response, status: :created
  end

  private
    def environmental_reading_params(environmental_reading_type)
      input_params = params
      input_params[:reading] = params[environmental_reading_type.handle]
      input_params[:sensor_array_id] = @sensor_array.id
      input_params[:environmental_reading_type_id] = environmental_reading_type.id
      input_params.permit(:reading, :sensor_array_id, :environmental_reading_type_id)
    end

    def included_environmental_reading_types
      environmental_reading_types = @environmental_reading_types.map {|e| e.handle }
      environmental_reading_types & params.keys
    end

    def unknown_params
      params.keys - included_environmental_reading_types - ["sensor_array", "format", "controller", "action"]
    end
end
