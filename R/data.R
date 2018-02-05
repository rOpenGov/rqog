#' 
#' Metadata for 2018 Quality of Government institute Basic Data
#' 
#' Generated automatically from spss-version of Quality of Government Basic data using \code{tidymetadata::create_metadata()} function. 
#' Formatted in tidy-format with row per each value of an indicator. Numeric indicators have a single row per indicator.   
#' 
#' @format A data frame with 558 rows and five columns 
#' \describe{
#'    \item{code}{Indicator code in data}
#'    \item{name}{Name of the indicator}
#'    \item{value}{Indicator value for factor indicator}
#'    \item{label}{Value label for factor indicators}
#'    \item{class}{Class of the indicator. Numeric, factor or character}
#' }
#' @Source \url{https://qog.pol.gu.se/data/datadownloads/qogbasicdata}
"meta_basic"

#'
#' Metadata for 2018 Quality of Government institute Standard Data
#' 
#' Generated automatically from spss-version of Quality of Government Standard data using \code{tidymetadata::create_metadata()} function. 
#' Formatted in tidy-format with row per each value of an indicator. Numeric indicators have a single row per indicator.   
#' 
#' @format A data frame with 2718 rows and five columns 
#' \describe{
#'    \item{code}{Indicator code in data}
#'    \item{name}{Name of the indicator}
#'    \item{value}{Indicator value for factor indicator}
#'    \item{label}{Value label for factor indicators}
#'    \item{class}{Class of the indicator. Numeric, factor or character}
#' }
#' @Source \url{https://qog.pol.gu.se/data/datadownloads/qogstandarddata}
"meta_standard"

#'
#' Metadata for 2018 Quality of Government institute Standard Data
#' 
#' Generated automatically from spss-version of Quality of Government OECD data using \code{tidymetadata::create_metadata()} function. 
#' Formatted in tidy-format with row per each value of an indicator. Numeric indicators have a single row per indicator.   
#' 
#' @format A data frame with 1407 rows and five columns 
#' \describe{
#'    \item{code}{Indicator code in data}
#'    \item{name}{Name of the indicator}
#'    \item{value}{Indicator value for factor indicator}
#'    \item{label}{Value label for factor indicators}
#'    \item{class}{Class of the indicator. Numeric, factor or character}
#' }
#' @Source \url{https://qog.pol.gu.se/data/datadownloads/qogoecddata}
"meta_oecd"

# # Create datas with
# library(tidyverse)
# library(tidymetadata) # devtools::install_github("muuankarski/tidymetadata")
# library(rqog)
# 
# # Basic
# d <- read_qog(which.data = "basic", data.type = "time-series", file.format = "sav")
# meta_basic <- tidymetadata::create_metadata(d)
# meta_basic <- meta_basic %>% select(code,name,value,label,class)
# save(meta_basic, file="./data/meta_basic.rda")
# 
# # Standard
# d <- read_qog(which.data = "standard", data.type = "time-series", file.format = "sav")
# meta_standard <- tidymetadata::create_metadata(d)
# meta_standard <- meta_standard %>% select(code,name,value,label,class)
# save(meta_standard, file="./data/meta_standard.rda")
# 
# # Oecd
# d <- read_qog(which.data = "oecd", data.type = "time-series", file.format = "sav")
# meta_oecd <- tidymetadata::create_metadata(d)
# meta_oecd <- meta_oecd %>% select(code,name,value,label,class)
# save(meta_oecd, file="./data/meta_oecd.rda")