# rqog-package. Download data from the Quality of Government Institute data

Download latest datasets from the [Quality of Government Institute](https://qog.pol.gu.se/data) using the function `read_qog()`. See `?read_qog` for instructions.

## Installation

```r
dectools::install_github("ropengov/rqog")
library(rqog)
```

## Use

**Download data**

```r
library(rqog)
dat <- read_qog(which.data = "standard", data.dir = "datafolder")
```

**Browse metadata**

```r
library(rqog)
meta_standard_ts[grepl("Corruption", meta_standard_ts$name, ignore.case = TRUE),]
```

  

See the vignette for examples <http://ropengov.github.io/rqog/articles/rqog_tutorial.html> and [data.markuskainu.fi/qog/](http://data.markuskainu.fi/qog/index.html) for an interactive access to metadata.

Copyright (C) 2012-2018 Markus Kainu <markuskainu@gmail.com>. MIT-licence.

## Disclaimer

This package is in no way officially related to or endorsed by Quality of Government Institute.
