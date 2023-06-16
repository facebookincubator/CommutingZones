# Copyright (c) Facebook, Inc. and its affiliates.
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

library(usethis)
library(stringi)

cz_data <- read.csv(paste0(
  "https://data.humdata.org/dataset/",
  "b7aaa3d7-cca2-4364-b7ce-afe3134194a2",
  "/resource/3c068b51-5f0d-4ead-80ba-97312ec034e4/download/",
  "data-for-good-at-meta-commuting-zones-march-2023.csv"
))

cz_data$country <- stringi::stri_escape_unicode(cz_data$country)
cz_data$name <- NULL
usethis::use_data(
  cz_data,
  overwrite = TRUE,
  compress = "bzip2",
  internal = FALSE
)
