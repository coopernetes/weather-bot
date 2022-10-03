# Weather Bot on Raspberry Pi
A simple bot to control LEDs based on hourly weather data. 

APIs in use:
- https://api.weather.gc.ca/openapi?f=html

## Example Usage

```shell
_bbox="-78.975906,43.845495,-78.814545,43.991825"
_this_hour=$(date +%Y-%m-%dT%H)
_airport="CYYZ"

# View real-time Surface Observations by feature ID
curl -fsS "https://api.weather.gc.ca/collections/swob-realtime/items/${_this_hour}00-${_airport}-AUTO-swob.xml"

# View real-time Surface Observations from 2022-10-02 00:00:00Z - current time (open range)
curl -fsS "https://api.weather.gc.ca/collections/swob-realtime/items?f=json&lang=en-CA&limit=1000&bbox=${_bbox}&datetime=2022-10-02T00%3A00%3A00Z%2F.." | jq

# View real-time bulletins
# NOTE: This currently fails. Not sure why. 
curl -fsS "https://api.weather.gc.ca/collections/bulletins-realtime/items?f=json&lang=en-CA&limit=1000&bbox=${_bbox}&datetime=${_this_hour}%3A00%3A00Z%2F.." | jq

# View real-time Air Quality Health Index (AQHI)
curl -fsS "https://api.weather.gc.ca/collections/aqhi-observations-realtime/items?f=json&lang=en-CA&limit=1000&bbox=${_bbox}&datetime=${_this_hour}%3A00%3A00Z%2F.." | jq
```
