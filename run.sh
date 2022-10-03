#!/usr/bin/env bash
set -e
set -o pipefail
_this_hour=$(date -u +%Y-%m-%d-%H)
_airport=${AIRPORT:-CYOO}
echo "${_this_hour}00 weather for ${_airport}"
_out=$(curl -fsS "https://api.weather.gc.ca/collections/swob-realtime/items/${_this_hour}00-${_airport}-AUTO-swob.xml" | jq -M)

if [ ! -z "$DEBUG" ]; then
  echo "DEBUG: Out ${_out}"
fi	

echo "Temp: $(jq '.properties.air_temp' <<< $_out)$(jq -r '.properties["air_temp-uom"]' <<< $_out)"
