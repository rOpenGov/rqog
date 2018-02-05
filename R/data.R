#' 
#' Metadata for 2018 Quality of Government institute Basic Data - time-series
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
"meta_basic_ts"

#' Metadata for 2018 Quality of Government institute Basic Data - cross-sectional
#' 
#' Generated automatically from spss-version of Quality of Government Basic data using \code{tidymetadata::create_metadata()} function. 
#' Formatted in tidy-format with row per each value of an indicator. Numeric indicators have a single row per indicator.   
#' 
#' @format A data frame with 644 rows and five columns 
#' \describe{
#'    \item{code}{Indicator code in data}
#'    \item{name}{Name of the indicator}
#'    \item{value}{Indicator value for factor indicator}
#'    \item{label}{Value label for factor indicators}
#'    \item{class}{Class of the indicator. Numeric, factor or character}
#' }
"meta_basic_cs"


#'
#' Metadata for 2018 Quality of Government institute Standard Data - cross-sectional
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
"meta_std_ts"

#'
#' Metadata for 2018 Quality of Government institute Standard Data - cross-sectional
#' 
#' Generated automatically from spss-version of Quality of Government Standard data using \code{tidymetadata::create_metadata()} function. 
#' Formatted in tidy-format with row per each value of an indicator. Numeric indicators have a single row per indicator.   
#' 
#' @format A data frame with 2393 rows and five columns 
#' \describe{
#'    \item{code}{Indicator code in data}
#'    \item{name}{Name of the indicator}
#'    \item{value}{Indicator value for factor indicator}
#'    \item{label}{Value label for factor indicators}
#'    \item{class}{Class of the indicator. Numeric, factor or character}
#' }
"meta_std_cs"



#'
#' Metadata for 2018 Quality of Government institute Standard Data - time-series
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
"meta_oecd_ts"

#'
#' Metadata for 2018 Quality of Government institute Standard Data - cross-sectional
#' 
#' Generated automatically from spss-version of Quality of Government OECD data using \code{tidymetadata::create_metadata()} function. 
#' Formatted in tidy-format with row per each value of an indicator. Numeric indicators have a single row per indicator.   
#' 
#' @format A data frame with 1319 rows and five columns 
#' \describe{
#'    \item{code}{Indicator code in data}
#'    \item{name}{Name of the indicator}
#'    \item{value}{Indicator value for factor indicator}
#'    \item{label}{Value label for factor indicators}
#'    \item{class}{Class of the indicator. Numeric, factor or character}
#' }
"meta_oecd_cs"


# # Create datas with
# library(tidyverse)
# library(tidymetadata) # devtools::install_github("muuankarski/tidymetadata")
# library(rqog)
# 
# # Basic
# ## time-series
# d <- read_qog(which.data = "basic", data.type = "time-series", file.format = "sav")
# meta_basic_ts <- tidymetadata::create_metadata(d) %>% 
#   select(code,name,value,label,class)
# save(meta_basic_ts, file="./data/meta_basic_ts.rda")
# ## cross-section
# d <- read_qog(which.data = "basic", data.type = "cross-sectional", file.format = "sav")
# meta_basic_cs <- tidymetadata::create_metadata(d) %>% 
#   select(code,name,value,label,class)
# save(meta_basic_cs, file="./data/meta_basic_cs.rda")
# 
# # Standard
## time-series
# d <- read_qog(which.data = "standard", data.type = "time-series", file.format = "sav")
# meta_std_ts <- tidymetadata::create_metadata(d) %>%
#   select(code,name,value,label,class)
# save(meta_std_ts, file="./data/meta_std_ts.rda")
# ## cross-section
# d <- read_qog(which.data = "standard", data.type = "cross-sectional", file.format = "sav")
# meta_std_cs <- tidymetadata::create_metadata(d) %>%
#   select(code,name,value,label,class)
# save(meta_std_cs, file="./data/meta_std_cs.rda")
# 
# 
# # Oecd
# ## time-series
# d <- read_qog(which.data = "oecd", data.type = "time-series", file.format = "sav")
# meta_oecd_ts <- tidymetadata::create_metadata(d) %>% 
#   select(code,name,value,label,class)
# save(meta_oecd_ts, file="./data/meta_oecd_ts.rda")
# ## cross-section
# d <- read_qog(which.data = "oecd", data.type = "cross-sectional", file.format = "sav")
# meta_oecd_cs <- tidymetadata::create_metadata(d) %>% 
#   select(code,name,value,label,class)
# save(meta_oecd_cs, file="./data/meta_oecd_cs.rda")
