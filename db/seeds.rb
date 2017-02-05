# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cats_away = Craft.create({name: 'Cats Awaya'})
nav_array = cats_away.sensor_arrays.create({name: 'Navigation'})
loc = nav_array.coordinates.create(latitude: 42, longitude: 24, timestamp: DateTime.now)
