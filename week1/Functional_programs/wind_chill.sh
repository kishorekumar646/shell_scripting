#!/bin/bash

wind_chill()
{
	echo "hi"
	if [ "$temperature" -le 50 -a "$speed" -ge 3 -o "$speed" -le 120 ]; then
		wind=$(echo "$(( (35.74 + (0.6215 * $temperature) + ((0.4275 * $temperature) - 35.75) * ($speed ** 0.16) ) ))")
		echo "$wind"
		echo "kishore"
	fi
}

read -p "Enter temperature : " temperature
read -p "Enter speed : " speed

wind_chill $temperature $speed