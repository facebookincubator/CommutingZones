.onLoad <- function(libname, pkgname) {
  invisible(suppressPackageStartupMessages(
    sapply("ggmap", requireNamespace, quietly = TRUE)
  ))
}
