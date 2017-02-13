namespace :weather do
  desc "Weather Tasks"
  task :get_weather => :environment do
    readings = Rails.env.production? ? (JSON.parse `python scripts/weather.py`) : {'temp': 25.0, 'humidity': 50, 'pressure': 1000}
    Craft.first.sensor_arrays.find_by(name: 'Internal').weather_readings.create(readings)
  end
end
