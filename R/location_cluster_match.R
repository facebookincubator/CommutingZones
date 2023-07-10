# Copyright (c) Meta Platforms, Inc. and its affiliates.
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

#' The Commuting Zones main function to get location clusters.
#'
#' @description
#' Match all location points to their clusters defined by user movement between
#' cities. The main wrapper function.
#' @inheritParams get_location_lat_long
#' @inheritParams filter_cluster_file
#'
#' @return
#' A data frame where each row represents a location in location_data and their
#' specific cluster.
#'
#' @export
#' @examples
#' \dontrun{
#' location_df <- data.frame(
#'   location = c("Austin", "Los Angeles", "Buenos Aires"),
#'   country = c("United States", "United States", "Argentina")
#' )
#'
#' matched_df <- commuting_zones(
#'   data = location_df,
#'   location_col_name = "location",
#'   country_col_name = "country",
#'   gmaps_key = NULL # Not required
#' )
#'
#' head(matched_df$matched_spdf)
#' plot(matched_df)
#' }
commuting_zones <- function(
    data,
    location_col_name,
    country_col_name,
    gmaps_key = NULL,
    quiet = FALSE,
    ...) {
  location_data <- get_location_lat_long(
    data,
    location_col_name,
    country_col_name,
    gmaps_key,
    quiet,
    ...
  )

  country_name <- unique(data[, country_col_name])

  cluster_data <- filter_cluster_file(country_name)

  matched_df_list <- location_to_cluster_match(
    location_data,
    cluster_data,
    quiet = quiet,
    ...
  )

  return(matched_df_list)
}


#' Load Commuting Zones Clusters from Data For Good.
#'
#' @description This method loads the Community Zones Clusters CSV into memory
#' and imports the file in a format compatible with the Shapefile library.
#'
#' @param country_name specific country in which clusters should be located.
#' Default is NULL.
#'
#' @return shapefile data.frame that holds values for region, country,
#' fbcz_id (cluster id), fbcz_id_num (cluster number), name, cz_gen_ds (date of
#' update), win_population, win_roads_km, area, geography (polygon with points
#' that form the cluster).
#'
#' @export
filter_cluster_file <- function(country_name) {
  s_df <- sf::st_as_sf(CommutingZones::cz_data, wkt = "geography")

  if (!is.null(country_name)) {
    country_name <- tolower(country_name)
    if (!all(country_name %in% tolower(s_df$country))) {
      stop("country_name allowed: ", paste(sort(unique(s_df$country)), collapse = ", "))
    }
    s_df <- s_df[tolower(s_df$country) %in% country_name, ]
  } else {
    stop(paste0(
      "Please specify country_name to be able to filter the Commuting Zones",
      "data."
    ))
  }

  return(s_df)
}


#' Match all locations to their cluster, via lat and long.
#'
#' @description
#' Match all location points to their clusters defined by user movement between
#' cities.
#' @param location_data data.frame object that holds the location name,
#' latitude and longitude for all locations.
#' @param cluster_data data.frame object with all polygons. Each row represents
#' a different cluster with an \code{sf::POLYGON} or \code{sf::MULTIPOLYGON}
#' object that has the points that are joined to form that cluster.
#' @param longitude_col_name,latitude_col_name Character. Names of the columns
#' containing the longitude and latitud coordinates in \code{location_data}.
#' @inheritParams get_location_lat_long
#'
#' @return
#' A data frame where each row represents a location in \code{location_data}
#' and their specific cluster.
#'
#' @export
#' @examples
#' location_df <- data.frame(
#'   location = c("Austin", "Los Angeles", "Buenos Aires"),
#'   country = c("United States", "United States", "Argentina")
#' )
#' location_df <- get_location_lat_long(
#'   location_df,
#'   location_col_name = "location",
#'   country_col_name = "country"
#' )
#' cluster_file <- filter_cluster_file(country_name = "United States")
#' 
#' # Note: location_df must contain latitude and longitude
#' # matched_df <- location_to_cluster_match(
#' #   location_df, cluster_file
#' # )
location_to_cluster_match <- function(
    location_data,
    cluster_data,
    longitude_col_name = "longitude",
    latitude_col_name = "latitude",
    quiet = FALSE,
    ...) {
  spdf <- sf::st_as_sf(
    cluster_data[, !colnames(cluster_data) %in% c("country")]
  )
  spdf <- spdf[sf::st_is_valid(spdf), ]

  if (all(c(longitude_col_name, latitude_col_name) %in%
    colnames(location_data))) {
    location_data <- sf::st_as_sf(
      location_data,
      coords = c(longitude_col_name, latitude_col_name)
    )
    matched_spdf <- sf::st_join(
      location_data, spdf
    )
    if (!quiet) post_msgs(matched_spdf)
  } else {
    stop(
      paste0(
        "Longitude column under the name '", 
        longitude_col_name, 
        "' or latitude column under the name '", 
        latitude_col_name, 
        "' were not found in the location dataset.",
        " Consider manually adding coordinates to locations or including your",
        " GMaps API key by editing the `gmaps_key` parameter."
      )
    )
  }
  output <- list(
    matched_spdf = matched_spdf,
    cluster_file = spdf
  )
  class(output) <- c("location_to_cluster_match", class(output))
  return(output)
}


#' Post messages letting user know how many locations were matched to their CZ
#' clusters.
#'
#' @param df data.frame to run the analysis on.
post_msgs <- function(df) {
  total_rows <- nrow(df)
  nulled_rows <- sum(is.na(df$fbcz_id_num))
  if (nulled_rows == 0) {
    message(
      "All locations were matched successfully to a Commuting Zones cluster."
    )
  } else {
    message(
      paste0(
        "There ",
        ifelse(nulled_rows == 1, "was ", "were "),
        nulled_rows,
        " out of ",
        total_rows,
        " locations that were not matched to a cluster.",
        "\nNon-matched locations represent ",
        round(nulled_rows / total_rows, 2) * 100,
        "% of total locations."
      )
    )
  }
}
