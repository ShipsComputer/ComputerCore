namespace :navigation do
  desc "Navigation Tasks"
  task :get_location => :environment do
    DEVICE = "/dev/ttyACM0"

    gps     = Serial.new(DEVICE, 4800) if Rails.env.production?
    decoder = NMEAPlus::Decoder.new
    rmc = nil

    while rmc.nil?
      nmea_sentence = Rails.env.production? ? gps.gets : "$GPRMC,025658.00,A,4523.45545,N,07544.02792,W,0.733,,050217,,,A*61\r\n"

      msg = decoder.parse(nmea_sentence) rescue redo
      msg_type = msg.try(:data_type)

      rmc = msg if msg_type == 'GPRMC' && msg.checksum_ok?
    end

    Craft.first.sensor_arrays.find_by(name: 'Internal').coordinates.create(latitude: rmc.latitude, longitude: rmc.longitude, timestamp: rmc.utc_time)
  end
end
