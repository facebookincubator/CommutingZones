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
filter_cluster_file <- function(
    country_name) {
  data("cz_data", envir = environment())
  s_df <- sf::st_as_sf(fbcz_data, wkt = "geography")

  if (!is.null(country_name)) {
    country_name <- tolower(country_name)
    s_df <- s_df[tolower(s_df$country) == country_name, ]
  } else {
    stop(paste0(
      "Please specify country_name to be able to filter the Commuting Zones",
      "data.")
      )
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
#' @param cluster_data data.frame object with all polygons.  Each row represents
#' a different cluster with an sf::POLYGON or sf::MULTIPOLYGON object that has
#' the points that are joined to form that cluster.
#' @param longitude_col_name name of the longitude column in the location_data
#' data.frame.
#' @param latitude_col_name name of the latitude column in the location_data
#' data.frame.
#'
#' @return
#' A data frame where each row represents a location in location_data and their
#' specific cluster.
#'
#' @export
#' @examples
#' \dontrun{
#' location_df <- data.frame(
#'   location = c('Austin', 'New York'),
#'   country_name = c('United States', 'United States')
#' )
#' location_df <- get_location_lat_long(
#'   location_df,
#'   location_col_name='location',
#'   country_col_name='country_name')
#' cluster_file <- filter_cluster_file(country_name = 'United States')
#'
#' matched_df <- location_to_cluster_match(
#'   location_df, cluster_file
#' }
location_to_cluster_match <- function(
    location_data,
    cluster_data,
    longitude_col_name = "longitude",
    latitude_col_name = "latitude") {

  spdf <- sf::st_as_sf(cluster_data)
  spdf <- spdf[sf::st_is_valid(spdf), ]

  location_data <- sf::st_as_sf(
    location_data,
    coords = c(longitude_col_name, latitude_col_name))

  matched_spdf <- sf::st_join(
    location_data, spdf
  )

  post_msgs(matched_spdf)

  return(matched_spdf)
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
      "All locations were matched successfully to a Commuting Zones cluster.")
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
