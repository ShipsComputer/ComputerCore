every 1.minute do
  rake "navigation:get_location"
end

every 1.minute do
  rake "weather:get_weather"
end
