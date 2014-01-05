# rQog-package


## Installation


```r
library(devtools)
install_github(repo = "rQog", username = "muuankarski")
library(rQog)
```


## Examples


```r
library(rQog)
# Extracting the data
get_qog(which.data = "standard", data.dir = "datafolder")
# Reading the data
dat <- read_qog(which.data = "standard", data.dir = "datafolder")
# Subsetting the data
subset_dat <- subset_qog(object.name = "dat", country = c("Finland", "Sweden"), 
    years = 2000:2010, indicator = c("undp_hdi", "fh_polity2"))

```


