from sense_hat import SenseHat
from json import dumps

sense = SenseHat()
readings = {}

readings['temp'] =     round(sense.get_temperature(), 2)
readings['humidity'] = round(sense.get_humidity(), 2)
readings['pressure'] = round(sense.get_pressure(), 2)

print dumps(readings, ensure_ascii=False)
