# Retrieve and Read Quality of Government Institute data in R

Download data from Quality of Government Institute Basic data at
<http://www.qog.pol.gu.se/data/>

## Usage

``` r
read_qog(
  which_data = "basic",
  data_type = "time-series",
  year = 2023,
  data_dir = NULL,
  file_format = "csv",
  download_only = FALSE,
  cache = TRUE,
  update_cache = FALSE
)
```

## Arguments

- which_data:

  A string. Specify the name of the QoG data set to retrieve. Currently
  available `"basic"`, `"standard"`, `"oecd"` or `"social_policy"`.

- data_type:

  A string. Specify whether you want cross-sectional or time-series QoG
  data set to retrieve. Currently available `"cross-sectional"` or
  `"time-series"`.

- year:

  numeric. Specify the year of the dataset. Year refers to the
  publication year of the dataset not the year of a particular data
  point. Default `2019`

- data_dir:

  a path to a cache directory. The directory have to exist. The `NULL`
  (default) uses and creates 'rqog' directory in the temporary directory
  from [`tempdir`](https://rdrr.io/r/base/tempfile.html).

- file_format:

  A string. Specify the file format you want to download and import.
  Currently available `"csv"`,`"dta"`, `"sav"` or `"xlsx"`.

- download_only:

  a logical whether to only download and save the dataset and skip
  importing in R. Default is `FALSE`.

- cache:

  a logical whether to do caching. Default is `TRUE`.

- update_cache:

  a locigal whether to update cache. Default is `FALSE`.

## Value

data.frame

## Author

Markus Kainu \<markus.kainu(at)kapsi.fi\>

## Examples

``` r
# dat <- read_qog(which_data = "basic", year = 2019, data_dir="data")
```
