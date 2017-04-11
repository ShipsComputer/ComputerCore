cats_away                  = Craft.create({name: 'Cats Away', handle: 'cats_away'})
sensor_array               = cats_away.sensor_arrays.create({name: 'Core Pi', handle: 'core_pi'})
location                   = sensor_array.coordinates.create(latitude: 45, longitude: -75, timestamp: DateTime.now)
sensor_type                = SensorType.create({handle: 'temperature'})
sensor_reading             = sensor_array.sensor_readings.create({reading: 25.0, sensor_type: sensor_type})

SensorType.create({handle: 'pressure'})
SensorType.create({handle: 'pressure'})
