# Copyright (c) Facebook, Inc. and its affiliates.
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

#' CommutingZones
#' @docType package
#' @name CommutingZones
#' @importFrom ggmap geocode has_google_key mutate_geocode register_google
#' @importFrom ggplot2 aes element_blank element_text geom_sf ggplot labs theme
#' theme_bw
#' @importFrom stats time
#' @importFrom utils data
#' @importFrom dplyr sym group_by summarize left_join mutate distinct ungroup
#' "%>%"
#' @importFrom data.table :=
#' @importFrom sf st_as_sf st_join st_is_valid
"_PACKAGE"

utils::globalVariables(
  c(
    "geography",
    "geometry",
    "location",
    "location_country",
    "fbcz_id_num",
    "cz_data",
    "time",
    "location",
    "Y"
  )
)
