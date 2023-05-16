# Copyright (c) Facebook, Inc. and its affiliates.
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

library(usethis)

zip_to_cz <- read.csv("/Users/nicocru/Downloads/zip_to_cz_tble.csv")

usethis::use_data(
  zip_to_cz,
  overwrite = TRUE,
  compress = "bzip2",
  internal = FALSE)
