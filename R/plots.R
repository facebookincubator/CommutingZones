# Copyright (c) Facebook, Inc. and its affiliates.
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

#' @param x \code{location_to_cluster_match()} output.
#' @param ... additional arguments
#'
#' @rdname location_to_cluster_match
#' @export
plot.location_to_cluster_match <- function(x, ...) {
  matched_df <- x$matched_spdf
  matched_df <- matched_df[!is.na(matched_df$fbcz_id_num), ]
  cluster_file <- x$cluster_file

  map_settings <- theme_bw() +
    theme(
      axis.line = element_blank(),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_blank(),
      panel.border = element_blank(),
      axis.text = element_blank(),
      axis.ticks = element_blank(),
      axis.title = element_blank(),
      plot.title = element_text(hjust = 0.5),
      plot.subtitle = element_text(hjust = 0.5))

  cluster_location_plot <- ggplot() +
    geom_sf(
      data = cluster_file,
      aes(geometry = geography),
      fill = NA,
      color = "#373472") +
    map_settings +
    geom_sf(
      data = matched_df,
      aes(geometry = geometry),
      size = 1,
      color = "#E69600"
    ) +
    labs(caption = "Only locations that were matched to a cluster are plotted.")

  return(cluster_location_plot)
}
