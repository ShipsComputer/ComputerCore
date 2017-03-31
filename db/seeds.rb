cats_away = Craft.create({name: 'Cats Away', handle: 'cats_away'})
array     = cats_away.sensor_arrays.create({name: 'Core Pi', handle: 'core_pi'})
location  = array.coordinates.create(latitude: 42, longitude: 24, timestamp: DateTime.now)
weather   = array.weather_readings.create(temp: 25.0, humidity: 50, pressure: 1000)
