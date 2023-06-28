---
sidebar_position: 1
---

# Getting Started with Commuting Zones

---

## 1. Install R

CommutingZones is an R package, therefore, it is necessary to have [R version 4.0.0 (or higher)](https://www.r-project.org/) installed in order to run the code. R is a free software environment for statistical computing and graphics. It compiles and runs on a wide variety of UNIX platforms, Windows and MacOS. To [download R](https://cran.r-project.org/mirrors.html), please choose your preferred [CRAN mirror](https://cran.r-project.org/mirrors.html).

If you have questions about R like how to download and install the software, or what the license terms are, please read their [answers to frequently asked questions](https://cran.r-project.org/faqs.html) before you send an email.

---

## 2. Installing the Commuting Zones Package

Since CommutingZones is currently only available on GitHub, the `remotes` package is a pre-requisite to install it. If you haven't installed this package yet, first run:

```
install.packages("remotes", repos='http://cran.us.r-project.org')
```

To install the package, simply run the following commands.

```
install.packages("remotes")
remotes::install_github("facebookincubator/CommutingZones")
library(CommutingZones)
```

## 3. Using Commuting Zones for Geo-experiments

Finally, to run geo-experiments using the Commuting Zones, we recommend downloading and installing `GeoLift`, an open source R package from Meta Marketing Science. Detailed instructions on how to get it can be found on [this](https://facebookincubator.github.io/CommutingZones/docs/Walkthrough/CZExperiment_GeoLift) chapter as well as [on GeoLift's website](https://facebookincubator.github.io/GeoLift/docs/GettingStarted/InstallingR).
