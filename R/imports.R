#' CommutingZones
#' @docType package
#' @name CommutingZones
#' @importFrom ggmap mutate_geocode has_google_key register_google
#' @importFrom stats time
#' @importFrom utils data
#' @importFrom dplyr sym group_by summarize left_join mutate distinct ungroup
#' "%>%"
#' @importFrom data.table :=
#' @importFrom sf st_as_sf st_join st_is_valid
"_PACKAGE"

utils::globalVariables(
  c(
    "location",
    "location_country",
    "fbcz_id_num",
    "cz_data",
    "time",
    "location",
    "Y"
  )
)
