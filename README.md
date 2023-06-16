# Commuting Zones - OST
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Commuting zones are geographic areas where people live and work and are useful for understanding local economies, as well as how they differ from traditional boundaries. These zones are a set of boundary shapes built using aggregated estimates of home and work locations. Data used to build commuting zones is aggregated and de-identified.

If you use this dataset please reference / cite Data for Good at Meta and include a link to the Commuting Zones page here: https://dataforgood.facebook.com/dfg/tools/commuting-zones

## Installation instructions
Run these commands to have the Commuting Zones package available to use.
```{r}
install.packages("remotes")
remotes::install_github("facebookincubator/CommutingZones")
```

## Create Google Maps API key 
Visit [this](https://developers.google.com/maps/documentation/maps-static/get-api-key/) page and follow the instruction to obtain the API key.

## Demo
```{r}
library(CommutingZones)

location_df <- data.frame(
  location = c("Austin", "Los Angeles", "Buenos Aires"),
  country = c("United States", "United States", "Argentina")
)

matched_df <- commuting_zones(
  data = location_df,
  location_col_name = 'location',
  country_col_name = 'country',
  gmaps_key = 'Enter the Google Maps API key here'
)

head(matched_df$matched_spdf)
plot(matched_df)

```

## License
CommutingZones is MIT licensed, as found in the LICENSE file.
