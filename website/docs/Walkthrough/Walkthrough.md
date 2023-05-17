---
sidebar_position: 1
---

# Commuting Zones Walkthrough

---

```
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
