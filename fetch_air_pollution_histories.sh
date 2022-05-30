# Fetch Air Pollution (one file per month)
# Author: Didier DONSEZ

TYPE="air-pollution"

# Student's API Key
API_KEY=XXXXXXXXXXXXXXXXXXX

fetch_history() {
    LAT=$1
    LON=$2
    START=$(date -jf "%Y-%m-%d %H:%M:%S" "$3" +%s)
    END=$(date -jf "%Y-%m-%d %H:%M:%S" "$4" +%s)
    OUTPUT=air_pollution/$TYPE-$5

    curl "http://api.openweathermap.org/data/2.5/air_pollution/history?units=metric&lat=$LAT&lon=$LON&type=hour&start=$START&end=$END&appid=$API_KEY" | jq . > $OUTPUT
}

fetch_poi(){

POI=$1
LAT=$2
LON=$3

YEAR=2021

#fetch_history $LAT $LON "$YEAR-01-01 00:00:00" "$YEAR-02-01 00:00:00" $POI-$YEAR-01.json
#fetch_history $LAT $LON "$YEAR-02-01 00:00:00" "$YEAR-03-01 00:00:00" $POI-$YEAR-02.json
#fetch_history $LAT $LON "$YEAR-03-01 00:00:00" "$YEAR-04-01 00:00:00" $POI-$YEAR-03.json
#fetch_history $LAT $LON "$YEAR-04-01 00:00:00" "$YEAR-05-01 00:00:00" $POI-$YEAR-04.json
#fetch_history $LAT $LON "$YEAR-05-01 00:00:00" "$YEAR-06-01 00:00:00" $POI-$YEAR-05.json
fetch_history $LAT $LON "$YEAR-06-01 00:00:00" "$YEAR-07-01 00:00:00" $POI-$YEAR-06.json
fetch_history $LAT $LON "$YEAR-07-01 00:00:00" "$YEAR-08-01 00:00:00" $POI-$YEAR-07.json
fetch_history $LAT $LON "$YEAR-08-01 00:00:00" "$YEAR-09-01 00:00:00" $POI-$YEAR-08.json
fetch_history $LAT $LON "$YEAR-09-01 00:00:00" "$YEAR-10-01 00:00:00" $POI-$YEAR-09.json
fetch_history $LAT $LON "$YEAR-10-01 00:00:00" "$YEAR-11-01 00:00:00" $POI-$YEAR-10.json
fetch_history $LAT $LON "$YEAR-11-01 00:00:00" "$YEAR-12-01 00:00:00" $POI-$YEAR-11.json
fetch_history $LAT $LON "$YEAR-12-01 00:00:00" "2022-01-01 00:00:00" $POI-$YEAR-12.json

YEAR=2022

fetch_history $LAT $LON "$YEAR-01-01 00:00:00" "$YEAR-02-01 00:00:00" $POI-$YEAR-01.json
fetch_history $LAT $LON "$YEAR-02-01 00:00:00" "$YEAR-03-01 00:00:00" $POI-$YEAR-02.json
fetch_history $LAT $LON "$YEAR-03-01 00:00:00" "$YEAR-04-01 00:00:00" $POI-$YEAR-03.json
fetch_history $LAT $LON "$YEAR-04-01 00:00:00" "$YEAR-05-01 00:00:00" $POI-$YEAR-04.json
fetch_history $LAT $LON "$YEAR-05-01 00:00:00" "$YEAR-06-01 00:00:00" $POI-$YEAR-05.json
#fetch_history $LAT $LON "$YEAR-06-01 00:00:00" "$YEAR-07-01 00:00:00" $POI-$YEAR-06.json
#fetch_history $LAT $LON "$YEAR-07-01 00:00:00" "$YEAR-08-01 00:00:00" $POI-$YEAR-07.json
#fetch_history $LAT $LON "$YEAR-08-01 00:00:00" "$YEAR-09-01 00:00:00" $POI-$YEAR-08.json
#fetch_history $LAT $LON "$YEAR-09-01 00:00:00" "$YEAR-10-01 00:00:00" $POI-$YEAR-09.json
#fetch_history $LAT $LON "$YEAR-10-01 00:00:00" "$YEAR-11-01 00:00:00" $POI-$YEAR-10.json
#fetch_history $LAT $LON "$YEAR-11-01 00:00:00" "$YEAR-12-01 00:00:00" $POI-$YEAR-11.json
#fetch_history $LAT $LON "$YEAR-12-01 00:00:00" "2023-01-01 00:00:00" $POI-$YEAR-12.json

}


# Batiment IMAG
fetch_poi IMAG 45.19038713118452 5.766778422455066

