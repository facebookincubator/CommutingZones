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

## Demo
```{r}
library(CommutingZones)

df <- data.frame(
   'location' = c("Austin", "Los Angeles", "Buenos Aires"),
   'country' = c("United States", "United States", "Argentina")
)
df <- get_location_lat_long(
   df,
   location_col_name = "location",
   country_col_name = "country"
)

cluster_file <- filter_cluster_file(country_name = 'United States')

matched_df_list <- location_to_cluster_match(
   df,
   cluster_file
)

head(matched_df_list$matched_spdf)

plot(matched_df_list)
```

## License
CommutingZones is MIT licensed, as found in the LICENSE file.
