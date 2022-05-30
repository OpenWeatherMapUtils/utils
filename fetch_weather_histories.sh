# Fetch Weather (one file per week)
# Author: Didier DONSEZ

if [[ -z "${OWM_API_KEY}" ]]; then
   echo "OWM_API_KEY is undefined"
   exit
fi

if [[ -z "${OWM_POI_NAME}" ]]; then
   echo "OWM_POI_NAME is undefined"
   exit
fi

if [[ -z "${OWM_POI_LAT}" ]]; then
   echo "OWM_POI_LAT is undefined"
   exit
fi

if [[ -z "${OWM_POI_LON}" ]]; then
   echo "OWM_POI_LON is undefined"
   exit
fi

TYPE="weather"

# Student's API Key
API_KEY=${OWM_API_KEY}


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

FIRST=$(date -v-365d +%s)

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

fetch_poi ${OWM_POI_NAME} ${OWM_POI_LAT} ${OWM_POI_LON}

