#' Commuting Zones Dataset
#'
#' March 2023
#'
#' @format A data frame with defined lat & long polygons for each cluster.
#' \describe{
#'    \item{region}{Continent.}
#'    \item{fbcz_id}{String: Commuting Zones id.}
#'    \item{fbcz_id_num}{Integer: unique Commuting Zones id.}
#'    \item{cz_gen_ds}{Date in which Commuting Zones were built.}
#'    \item{win_population}{Population estimate for Commuting Zones id.}
#'    \item{win_roads_km}{Estimate of the length of the roads.}
#'    \item{area}{Area of the Commuting Zone (km2).}
#'    \item{country}{Country that contains majority of the Commuting Zone.}
#'    \item{geography}{Shape WKT.}
#'
#' }
#' @source https://data.humdata.org/dataset/commuting-zones
"cz_data"