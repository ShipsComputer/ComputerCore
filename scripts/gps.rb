require 'net/http'
require 'nmea_plus'
require 'rubyserial'

DEVICE = "/dev/ttyACM0"

gps     = Serial.new(DEVICE, 4800)
decoder = NMEAPlus::Decoder.new
rmc     = nil

while rmc.nil?
  nmea_sentence = gps.gets

  msg = decoder.parse(nmea_sentence) rescue redo
  rmc = msg if msg.data_type == 'GPRMC' && msg.checksum_ok?
end

uri = URI('http://shipscomputer/api/v1/coordinates')
res = Net::HTTP.post_form(uri, latitude: rmc.latitude, longitude: rmc.longitude, timestamp: rmc.utc_time, sensor_array: 'core_pi')
puts res.body
