# Create datas with
library(tidyverse)
library(tidymetadata) # remotes::install_github("muuankarski/tidymetadata")
library(rqog)
# 

# 2022
# Basic
## time-series
d <- read_qog(which_data = "basic", data_type = "time-series", year = 2022, file_format = "sav")
meta_basic_ts_2022 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_basic_ts_2022, file="./data/meta_basic_ts_2022.rda", compress = "bzip2")

# cross-section
d <- read_qog(which_data = "basic", data_type = "cross-sectional", year = 2022, file_format = "sav")
meta_basic_cs_2022 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_basic_cs_2022, file="./data/meta_basic_cs_2022.rda", compress = "bzip2")

# Standard
# time-series
d <- read_qog(which_data = "standard", data_type = "time-series", year = 2022, file_format = "sav")
meta_std_ts_2022 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_std_ts_2022, file="./data/meta_std_ts_2022.rda", compress = "bzip2")
# cross-section
d <- read_qog(which_data = "standard", data_type = "cross-sectional", year = 2022, file_format = "sav")
meta_std_cs_2022 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_std_cs_2022, file="./data/meta_std_cs_2022.rda", compress = "bzip2")


# Oecd
# time-series
d <- read_qog(which_data = "oecd", data_type = "time-series",  year = 2022, file_format = "sav")
meta_oecd_ts_2022 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_oecd_ts_2022, file="./data/meta_oecd_ts_2022.rda", compress = "bzip2")
# cross-section
d <- read_qog(which_data = "oecd", data_type = "cross-sectional",  year = 2022, file_format = "sav")
meta_oecd_cs_2022 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_oecd_cs_2022, file="./data/meta_oecd_cs_2022.rda", compress = "bzip2")



# 2021
# Basic
## time-series
d <- read_qog(which_data = "basic", data_type = "time-series", year = 2021, file_format = "sav")
meta_basic_ts_2021 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_basic_ts_2021, file="./data/meta_basic_ts_2021.rda", compress = "bzip2")

# cross-section
d <- read_qog(which_data = "basic", data_type = "cross-sectional", year = 2021, file_format = "sav")
meta_basic_cs_2021 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_basic_cs_2021, file="./data/meta_basic_cs_2021.rda", compress = "bzip2")

# Standard
# time-series
d <- read_qog(which_data = "standard", data_type = "time-series", year = 2021, file_format = "sav")
meta_std_ts_2021 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_std_ts_2021, file="./data/meta_std_ts_2021.rda", compress = "bzip2")
# cross-section
d <- read_qog(which_data = "standard", data_type = "cross-sectional", year = 2021, file_format = "sav")
meta_std_cs_2021 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_std_cs_2021, file="./data/meta_std_cs_2021.rda", compress = "bzip2")


# Oecd
# time-series
d <- read_qog(which_data = "oecd", data_type = "time-series",  year = 2021, file_format = "sav")
meta_oecd_ts_2021 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_oecd_ts_2021, file="./data/meta_oecd_ts_2021.rda", compress = "bzip2")
# cross-section
d <- read_qog(which_data = "oecd", data_type = "cross-sectional",  year = 2021, file_format = "sav")
meta_oecd_cs_2021 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_oecd_cs_2021, file="./data/meta_oecd_cs_2021.rda", compress = "bzip2")

# 2020
# Basic
## time-series
d <- read_qog(which_data = "basic", data_type = "time-series", year = 2020, file_format = "sav")
meta_basic_ts_2020 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_basic_ts_2020, file="./data/meta_basic_ts_2020.rda", compress = "bzip2")

# cross-section
d <- read_qog(which_data = "basic", data_type = "cross-sectional", year = 2020, file_format = "sav")
meta_basic_cs_2020 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_basic_cs_2020, file="./data/meta_basic_cs_2020.rda", compress = "bzip2")

# Standard
# time-series
d <- read_qog(which_data = "standard", data_type = "time-series", year = 2020, file_format = "sav")
meta_std_ts_2020 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_std_ts_2020, file="./data/meta_std_ts_2020.rda", compress = "bzip2")
# cross-section
d <- read_qog(which_data = "standard", data_type = "cross-sectional", year = 2020, file_format = "sav")
meta_std_cs_2020 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_std_cs_2020, file="./data/meta_std_cs_2020.rda", compress = "bzip2")


# Oecd
# time-series
d <- read_qog(which_data = "oecd", data_type = "time-series",  year = 2020, file_format = "sav")
meta_oecd_ts_2020 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_oecd_ts_2020, file="./data/meta_oecd_ts_2020.rda", compress = "bzip2")
# cross-section
d <- read_qog(which_data = "oecd", data_type = "cross-sectional",  year = 2020, file_format = "sav")
meta_oecd_cs_2020 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_oecd_cs_2020, file="./data/meta_oecd_cs_2020.rda", compress = "bzip2")


# 2019
# Basic
# time-series
d <- read_qog(which_data = "basic", data_type = "time-series", year = 2019, file_format = "dta")
meta_basic_ts_2019 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_basic_ts_2019, file="./data/meta_basic_ts_2019.rda", compress = "bzip2")
## cross-section
d <- read_qog(which_data = "basic", data_type = "cross-sectional", year = 2019, file_format = "dta")
meta_basic_cs_2019 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_basic_cs_2019, file="./data/meta_basic_cs_2019.rda", compress = "bzip2")

# Standard
# time-series
d <- read_qog(which_data = "standard", data_type = "time-series", year = 2019, file_format = "dta")
meta_std_ts_2019 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_std_ts_2019, file="./data/meta_std_ts_2019.rda", compress = "bzip2")
## cross-section
d <- read_qog(which_data = "standard", data_type = "cross-sectional", year = 2019, file_format = "dta")
meta_std_cs_2019 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_std_cs_2019, file="./data/meta_std_cs_2019.rda", compress = "bzip2")


# Oecd
## time-series
d <- read_qog(which_data = "oecd", data_type = "time-series",  year = 2019, file_format = "dta")
meta_oecd_ts_2019 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_oecd_ts_2019, file="./data/meta_oecd_ts_2019.rda", compress = "bzip2")
## cross-section
d <- read_qog(which_data = "oecd", data_type = "cross-sectional",  year = 2019, file_format = "dta")
meta_oecd_cs_2019 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_oecd_cs_2019, file="./data/meta_oecd_cs_2019.rda", compress = "bzip2")


# # 2018
# Basic
# time-series
d <- read_qog(which_data = "basic", data_type = "time-series", year = 2018, file_format = "sav")
meta_basic_ts_2018 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_basic_ts_2018, file="./data/meta_basic_ts_2018.rda", compress = "bzip2")
## cross-section
d <- read_qog(which_data = "basic", data_type = "cross-sectional", year = 2018, file_format = "sav")
meta_basic_cs_2018 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_basic_cs_2018, file="./data/meta_basic_cs_2018.rda", compress = "bzip2")

# Standard
# time-series
d <- read_qog(which_data = "standard", data_type = "time-series", year = 2018, file_format = "dta")
meta_std_ts_2018 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_std_ts_2018, file="./data/meta_std_ts_2018.rda", compress = "bzip2")
## cross-section
d <- read_qog(which_data = "standard", data_type = "cross-sectional", year = 2018, file_format = "sav")
meta_std_cs_2018 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_std_cs_2018, file="./data/meta_std_cs_2018.rda", compress = "bzip2")


# Oecd
## time-series
d <- read_qog(which_data = "oecd", data_type = "time-series",  year = 2018, file_format = "sav")
meta_oecd_ts_2018 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_oecd_ts_2018, file="./data/meta_oecd_ts_2018.rda", compress = "bzip2")
## cross-section
d <- read_qog(which_data = "oecd", data_type = "cross-sectional",  year = 2018, file_format = "sav")
meta_oecd_cs_2018 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_oecd_cs_2018, file="./data/meta_oecd_cs_2018.rda", compress = "bzip2")


# 2017
# Basic
## time-series
d <- read_qog(which_data = "basic", data_type = "time-series", year = 2017, file_format = "sav")
meta_basic_ts_2017 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_basic_ts_2017, file="./data/meta_basic_ts_2017.rda", compress = "bzip2")
## cross-section
d <- read_qog(which_data = "basic", data_type = "cross-sectional", year = 2017, file_format = "sav")
meta_basic_cs_2017 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_basic_cs_2017, file="./data/meta_basic_cs_2017.rda", compress = "bzip2")
# #
# Standard
# time-series
d <- read_qog(which_data = "standard", data_type = "time-series", year = 2017, file_format = "dta")
meta_std_ts_2017 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_std_ts_2017, file="./data/meta_std_ts_2017.rda", compress = "bzip2")
## cross-section
d <- read_qog(which_data = "standard", data_type = "cross-sectional", year = 2017, file_format = "sav")
meta_std_cs_2017 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_std_cs_2017, file="./data/meta_std_cs_2017.rda", compress = "bzip2")


# Oecd
## time-series
d <- read_qog(which_data = "oecd", data_type = "time-series",  year = 2017, file_format = "sav")
meta_oecd_ts_2017 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_oecd_ts_2017, file="./data/meta_oecd_ts_2017.rda", compress = "bzip2")
## cross-section
d <- read_qog(which_data = "oecd", data_type = "cross-sectional",  year = 2017, file_format = "sav")
meta_oecd_cs_2017 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_oecd_cs_2017, file="./data/meta_oecd_cs_2017.rda", compress = "bzip2")

# 2016
# Basic
## time-series
d <- read_qog(which_data = "basic", data_type = "time-series", year = 2016, file_format = "sav")
meta_basic_ts_2016 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
# devtools::use_data()
save(meta_basic_ts_2016, file="./data/meta_basic_ts_2016.rda", compress = "bzip2")
## cross-section
d <- read_qog(which_data = "basic", data_type = "cross-sectional", year = 2016, file_format = "sav")
meta_basic_cs_2016 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_basic_cs_2016, file="./data/meta_basic_cs_2016.rda", compress = "bzip2")

# Standard
# time-series
d <- read_qog(which_data = "standard", data_type = "time-series", year = 2016, file_format = "dta")
meta_std_ts_2016 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_std_ts_2016, file="./data/meta_std_ts_2016.rda", compress = "bzip2")
## cross-section
d <- read_qog(which_data = "standard", data_type = "cross-sectional", year = 2016, file_format = "sav")
meta_std_cs_2016 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_std_cs_2016, file="./data/meta_std_cs_2016.rda", compress = "bzip2")

# Oecd
## time-series
d <- read_qog(which_data = "oecd", data_type = "time-series",  year = 2016, file_format = "sav")
meta_oecd_ts_2016 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_oecd_ts_2016, file="./data/meta_oecd_ts_2016.rda", compress = "bzip2")
## cross-section
d <- read_qog(which_data = "oecd", data_type = "cross-sectional",  year = 2016, file_format = "sav")
meta_oecd_cs_2016 <- tidymetadata::create_metadata(d) %>%
  select(code,name,value,label,class)
save(meta_oecd_cs_2016, file="./data/meta_oecd_cs_2016.rda", compress = "bzip2")