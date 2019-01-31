# rqog-package. Download data from the Quality of Government Institute data

Download latest datasets from the [Quality of Government Institute](https://qog.pol.gu.se/data) using the function `read_qog()`. See `?read_qog` for instructions.

## Installation

```r
devtools::install_github("ropengov/rqog")
```

## Use

**Download data**

```r
library(rqog)
dat <- read_qog(which_data = "standard", data_dir = "datafolder")
```

**Browse metadata**

```r
library(rqog)
meta_std_ts_2019[grepl("Corruption", meta_std_ts_2019$name, ignore.case = TRUE),]
```


See the vignette for examples <http://ropengov.github.io/rqog/articles/rqog_tutorial.html> and [data.markuskainu.fi/qog/](http://data.markuskainu.fi/qog/index.html) for an interactive access to metadata.

Copyright (C) 2012-2019 Markus Kainu <markuskainu@gmail.com>. MIT-licence.

## Disclaimer

This package is in no way officially related to or endorsed by Quality of Government Institute.
