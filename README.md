# rqog-package. Download data from the Quality of Government Institute data

Download latest datasets from the Quality of Government institute using the function `read_qog()`. See `?read_qog` for instructions

## Installation

```r
dectools::install_github("ropengov/rqog")
library(rqog)
```

## Download data

```r
library(rqog)
dat <- read_qog(which.data = "standard", data.dir = "datafolder")
```

See the vignette for examples

- <http://ropengov.github.io/rqog/articles/rqog_tutorial.html>


Copyright (C) 2012-2018 Markus Kainu <markuskainu@gmail.com>. MIT-licence.
