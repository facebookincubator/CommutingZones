# Copyright (c) Meta Platforms, Inc. and its affiliates.
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
#' @param quiet Boolean. Keep quiet? If not, show warnings and messages.
#' @param ... Additional parameters
#'
#' @export
#' @examples
#' \dontrun{
#' # Example dataset:
#' df <- data.frame(
#'   "location" = c("Austin", "Toronto"),
#'   "country" = c("United States", "Canada")
#' )
#' df <- get_location_lat_long(
#'   df,
#'   location_col_name = "location",
#'   country_col_name = "country",
#'   gmaps_key = NULL # Or change for valid key.
#' )
#' }
get_location_lat_long <- function(
    data,
    location_col_name = "location",
    country_col_name = "country",
    gmaps_key = NULL,
    quiet = FALSE,
    ...) {
  check_gmaps_key(gmaps_key)
  if (isTRUE(nchar(gmaps_key) > 0)) {
    if (!location_col_name %in% colnames(data)) {
      stop(paste0(
        "Please specify the proper name of the location column for data",
        " using the location_col_name parameter.",
        "\n\nHint: run ?get_location_lat_long and see example section for ",
        "illustrative dataset"
      ))
    }
    
    if (!country_col_name %in% colnames(data)) {
      stop(paste0(
        "Please specify the proper name of the country column for data",
        " using the country_col_name parameter.",
        "\n\nHint: run ?get_location_lat_long and see example section for ",
        "illustrative dataset"
      ))
    }
    
    data$location_country <- paste0(
      data[, location_col_name], ", ", data[, country_col_name]
    )
    lat_long_data <- data %>%
      dplyr::distinct(location, location_country) %>%
      ggmap::mutate_geocode(location_country) %>%
      merge(
        data,
        by = c("location", "location_country")
      ) %>%
      rename(longitude = .data$lon, latitude = .data$lat) %>%
      select(.data$location, .data$country, .data$longitude, .data$latitude)
    return(lat_long_data)
  }
  if (!quiet) warning("No valid 'gmaps_key' provided so can't add coordinates")
  return(data)
}

#' Register API key if it is not registered.
#'
#' @param gmaps_key string containing your Google Maps API key.
#'
#' @rdname get_location_lat_long
#' @export
check_gmaps_key <- function(gmaps_key = NULL) {
  # Register API Key
  if (isTRUE(nchar(gmaps_key) > 0)) {
    ggmap::register_google(key = gmaps_key)
    
    if (!ggmap::has_google_key()) {
      stop(message(paste0(
        "To use this method, you need to register a valid GMaps API key.\n",
        "Get the key here https://developers.google.com/maps/documentation/maps-static/get-api-key/"
      )))
    }
    
    # Verify if the provided API key is valid.
    test_api_query <- NULL
    tryCatch(
      {
        test_api_query <- suppressMessages(ggmap::geocode("US"))
      },
      warning = function(w) {
        message(
          paste0(gsub("\'US\'", "", w$message))
        )
      },
      error = function(e) {
        message(e)
      }
    )
    
    if (is.null(test_api_query)) {
      stop(
        paste0(
          "Hint: See `ggmap::register_google()` or provide a valid key",
          " in the `gmaps_key` parameter."
        )
      )
    }
  }
}
