# Copyright (c) Facebook, Inc. and its affiliates.
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

#' Match location units to spatial location.
#' @description Find location latitude and longitude using Gmaps API.
#'
#' @param data dataset that holds locations that will be used.
#' @param location_col_name location column name in data in English to match lat
#' & long.
#' @param country_col_name country column name in data in English to make lat
#' long match easier.
#'
#' @export
#' @examples
#' \dontrun{
#' # Example dataset:
#' df <- data.frame(
#'   'location' = c("Austin", "Toronto"),
#'   'country' = c("United States", "Canada")
#' )
#' df <- get_location_lat_long(
#'   df,
#'   location_col_name = "location",
#'   country_col_name = "country"
#' )
#' }
get_location_lat_long <- function(
    data,
    location_col_name = "location",
    country_col_name = "country") {
  if (!ggmap::has_google_key()) {
    message(
      "To use this method, you need to register your GMaps API key.",
      "See `ggmap::register_google()`"
    )
  }

  if (!location_col_name %in% colnames(data)) {
    stop(paste0(
      "Please specify the proper name of the location column for data",
      " using the location_col_name parameter.",
      "\n\nHint: run ?get_location_lat_long and see example section for ",
      "illustrative dataset"))
  }

  if (!country_col_name %in% colnames(data)) {
    stop(paste0(
      "Please specify the proper name of the country column for data",
      " using the country_col_name parameter.",
      "\n\nHint: run ?get_location_lat_long and see example section for ",
      "illustrative dataset"))
  }

  data$location_country <- paste0(
    data[, location_col_name], ", ", data[, country_col_name]
  )
  lat_long_data <- data %>%
    dplyr::distinct(location, location_country) %>%
    ggmap::mutate_geocode(location_country) %>%
    merge(
      data, by = c("location", "location_country")
    )

  lat_long_data$longitude <- lat_long_data$lon
  lat_long_data$latitude <- lat_long_data$lat
  lat_long_data$location_country <- NULL
  lat_long_data$lon <- NULL
  lat_long_data$lat <- NULL

  return(lat_long_data)
}
