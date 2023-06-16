---
sidebar_position: 1
---

# Commuting Zones Walkthrough

---

```
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
