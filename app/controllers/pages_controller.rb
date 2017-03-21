class PagesController < ApplicationController
  def show
    get_sat_bearings
    render template: "pages/#{params[:page]}"
  end

  private
    def get_sat_bearings
      i4f3_latitude = -98
      @current_coordinates = Craft.first.sensor_arrays.first.coordinates.last
      base_station = Gstatsat::BaseStation.new(latitude: @current_coordinates.lat, longitude: @current_coordinates.lon)
      @satellite = Gstatsat::Satellite.new(longitude: i4f3_latitude)
      @bearing = Gstatsat::SatelliteBearing.new(satellite: @satellite, base_station: base_station)
    end
end
