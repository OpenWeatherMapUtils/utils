#!/bin/bash

# weather
QUERY='[ . as $parent | .list[] | {dt: .dt } * .main * {wind_speed: .wind.speed, wind_deg: .wind.deg, wind_gust:.wind.gust, cloudiness: .clouds.all, weather_id: .weather[0].id, weather_main: .weather[0].main, weather_description: .weather[0].description, weather_icon: .weather[0].icon, rain: .rain, snow:.snow } ]'
for FILE in weather/*.json.gz
do
OUTPUT=${FILE%%.*}
gunzip -c $FILE | jq "$QUERY" | json2csv > $OUTPUT.csv
done

# air_pollution
QUERY='[ . as $parent | .list[] | {dt: .dt, lat: $parent.coord.lat, lon: $parent.coord.lon}  * .components * .main  ]'
for FILE in air_pollution/*.json.gz
do
OUTPUT=${FILE%%.*}
gunzip -c $FILE | jq "$QUERY" | json2csv > $OUTPUT.csv
done
