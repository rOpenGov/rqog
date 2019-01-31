# This file is part of the rQog-package (https://github.com/muuankarski/rqog)

# Copyright (C) 2012-2019 Markus Kainu <markuskainu@gmail.com>. All rights reserved.

# This program is open source software; you can redistribute it and/or modify
# it under the terms of the FreeBSD License (keep this notice):
# http://en.wikipedia.org/wiki/BSD_licenses

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

#' Retrieve and Read Quality of Government Institute data in R
#' 
#' Download data from Quality of Government Institute Basic data at
#' \url{http://www.qog.pol.gu.se/data/}
#'
#' @param which_data A string. Specify the name of the QoG data set to retrieve. Currently available \code{"basic"}, \code{"standard"}, \code{"oecd"} or \code{"social_policy"}.
#' @param data_type A string. Specify whether you want cross-sectional or time-series QoG data set to retrieve. Currently available \code{"cross-sectional"} or \code{"time-series"}.
#' @param year numeric. Specify the year of the dataset. Year refers to the publication year of the dataset not the year of a particular data point. Default \code{2019}
#' @param data.dir a path to a cache directory. The directory have to exist.
#'        The \code{NULL} (default) uses and creates
#'        'rqog' directory in the temporary directory from
#'        \code{\link{tempdir}}.
#' @param file_format A string. Specify the file format you want to download and import. Currently available \code{"csv"},\code{"dta"}, \code{"sav"} or \code{"xlsx"}.
#' @param download_only a logical whether to only download and save the dataset and skip importing in R.  Default is \code{FALSE}.
#' @param cache a logical whether to do caching. Default is \code{TRUE}.
#' @param update_cache a locigal whether to update cache. Default is \code{FALSE}.

#'  
#' @return data.frame 
#' 
#' @export
#' @examples # dat <- read_qog(which_data = "basic", year = 2019, data.dir="data")
#' @author Markus Kainu <markuskainu(at)gmail.com> 

read_qog <- function(which_data = "basic", 
                     data_type="time-series", 
                     year = 2019,
                     data.dir = NULL, 
                     file_format = "csv",
                     download_only = FALSE,
                     cache = TRUE, update_cache = FALSE) {
  month = "jan"
  latest_year <- 2019
  # checks
  if (!year %in% 2008:latest_year) stop(glue("Data has been published between 2008 and {latest_year}"))
  if (year != 2019 & file_format == "xlsx") stop("Only the latest data is available in .xlsx-format. Archived data only in .dat, .sav or .csv format")
  if (year == 2014) stop("No data was published in 2014")
  # basic data
  if (which_data == "basic"){
    if (year %in% 2008:2011) stop("Basic Data was not published in 2008 - 2011")
    if (year == 2012) month <- "21may"
    if (year == 2013) month <- "30aug"
  }
  if (which_data == "standard"){
    if (year == 2008) month <- "15may"
    if (year == 2009) month <- "17jun"
    if (year == 2010) month <- "27may"
    if (year == 2011) month <- "6apr"
    if (year == 2012) stop("Standard Data was not published in 2012")
    if (year == 2013) month <- "20dec"
  }
  if (which_data == "oecd"){
    if (year %in% 2008:2013) stop("Oecd Data was not published in 2008-2013")
  }
  if (which_data == "social_policy"){
    if (year == 2008) month <- "4nov"
    if (year == 2009) stop("Social Policy Data was not published in 2009")
    if (year == 2010) month <- "22feb"
    if (year == 2011) stop("Social Policy Data was not published in 2011")
    if (year == 2012) month <- "4apr"
    if (year %in% 2013:2018) stop(glue("Social Policy Data was not published in {year}"))
  }

  # Beginning of the URL's for latest data
  if (year == 2019){
    data.url.begin <- "http://www.qogdata.pol.gu.se/data/"
  } else {
    data.url.begin <- "http://www.qogdata.pol.gu.se/dataarchive/"
  }

  if (!(which_data %in% c("basic","standard","std","oecd"))) stop('Wrong data name, use "basic","standard" or "oecd" instead')
  if (!(data_type %in% c("time-series","cross-sectional"))) stop('Wrong data type, use "time-series" or "cross-sectional" instead')
  
  if (file_format == "csv")  file_ext <- "csv"
  if (file_format == "dta")  file_ext <- "dta"
  if (file_format == "sav")  file_ext <- "sav"
  if (file_format == "xlsx") file_ext <- "xlsx"
  
  if (which_data == "basic")    dname <- "bas"
  if (which_data == "standard") dname <- "std"
  if (which_data == "std")      dname <- "std"
  if (which_data == "oecd")     dname <- "oecd"
  
  if (data_type == "cross-sectional") dtype <- "cs"
  if (data_type == "time-series")     dtype <- "ts"
  
  file.name <- glue("qog_{dname}_{dtype}_{month}{substr(year, 3, 4)}.{file_ext}")
  
  # creating local file path
  
  # Check whether to local file exist.
  # If it does not exist then download it
  
  
  if (cache){
    cache_dir <- data.dir
    # check option for update
    # get cache directory
    if (is.null(cache_dir)){
      cache_dir <- file.path(tempdir(), "rqog")
      if (!file.exists(cache_dir)) dir.create(cache_dir)
    } else {
      if (!file.exists(cache_dir)) {
        stop("The folder ", cache_dir, " does not exist")
      }
    }
    
    # cache filename
    cache_file <- file.path(cache_dir, file.name)
  }
  
  # if cache = FALSE or update or new: dowload else read from cache
  if (!cache || update_cache || !file.exists(cache_file)){
    
    if (file_format == "xlsx"){
      mode <- "wb"
    } else {
      mode <- "w"
    }
    data.url <- glue("{data.url.begin}{file.name}")
    message(glue("Local file not found. \n Downloading QoG {file.name} data \n from {data.url}\n in file: {cache_file}\n"))
    download.file(data.url, destfile = cache_file, mode = mode)
  }
  
  if (!download_only){
    
    if (cache & file.exists(cache_file)) {
      cf <- path.expand(cache_file)
      message(glue("Reading cache file {cf}"))
      # y <- readRDS(cache_file)
      if (file_format == "csv")  dd <- read.csv(cache_file, sep=",", stringsAsFactors = FALSE)
      if (file_format == "dta")  dd <- read_dta(cache_file)
      if (file_format == "sav")  dd <- read_sav(cache_file)
      if (file_format == "xlsx") dd <- read_excel(cache_file)
    }
    return(dd)
  }
  }

