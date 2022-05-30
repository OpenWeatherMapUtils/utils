# Fetch Weather (one file per week)
# Author: Didier DONSEZ

TYPE="weather"

# Student's API Key
API_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


fetch_history() {
    LAT=$1
    LON=$2
    START=$3
    END=$4
    OUTPUT=weather/$TYPE-$5

    curl "http://history.openweathermap.org/data/2.5/history/city?units=metric&lat=$LAT&lon=$LON&type=hour&start=$START&end=$END&appid=$API_KEY" | jq . > $OUTPUT
}

fetch_poi(){

POI=$1
LAT=$2
LON=$3

FIRST=1622851200

START=$FIRST
END=$(date -r $START -v+7d +%s)

for week in {0..51}
do
echo $POI $week $START $END
fetch_history_2 $LAT $LON $START $END $POI-$week.json

START=$END
END=$(date -r $START -v+7d +%s)

done

}

# My Lab 
fetch_poi_2 IMAG 45.19038713118452 5.766778422455066

