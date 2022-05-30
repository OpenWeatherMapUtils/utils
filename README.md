# OpenWeatherMap Utils

Utilities for OpenWeatherMap (fetching histories, showing and processing in Jupyter notebooks ...)

## Step 1: create an account on OpenWeatherMap.org

## Step 2: get your OpenWeatherMap.org API KEY

Open your profile and select [`My API Keys`](https://home.openweathermap.org/api_keys) for generating a new API KEY.

Copy the key in a shell

```bash
export OWM_API_KEY="MyAPIKeyHere"
```

## Step 3: fetch the weather and air pollution histories of your hometown

Get the latitude and the longitude of your hometown using [OpenStreetMap](https://www.openstreetmap.org).

Copy them in the current shell

```bash
export OWM_POI_LAT=45.5
export OWM_POI_LON=5.5
```

Fetch the weather history (one year, one file per week)
```bash

gzip weather/*.json
```

Fetch the air pollution history (one year, one file per month)
```bash

gzip air_pollution/*.json
```

Optional : Save your files
```bash
git add weather/*.json.gz
git add air_pollution/*.json.gz
git commit -m "save fetched files"
```

## Step 4: convert the `JSON` files into `CSV` files

Launch the script for convertion:
```bash
./json2csv
```

## Step 5: install and launch Jupyter

Install [Jupyter](https://jupyter.org/install) with your favorite package manager.

Launch Jupiter from your working directory :
```bash
jupyter notebook
```

## Step 6: open and execute the Jupyter notebooks for `weather` and `air_pollution`

Notebooks are weather.ipynb and air_pollution.ipynb

## Step 7: improve the Jupyter notebooks

See the [gallery of `plotly` plots and charts](https://plotly.com/python/)
