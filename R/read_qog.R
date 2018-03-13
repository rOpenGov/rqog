# This file is part of the rQog-package (https://github.com/muuankarski/rqog)

# Copyright (C) 2012-2018 Markus Kainu <markuskainu@gmail.com>. All rights reserved.

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
#' @param which.data A string. Specify the name of the QoG data set to retrieve. Currently available \code{"basic"}, \code{"standard"}, \code{"oecd"} or \code{"social_policy"}.
#' @param data.type A string. Specify whether you want cross-sectional or time-series QoG data set to retrieve. Currently available \code{"cross-sectional"} or \code{"time-series"}.
#' @param data.dir a path to a cache directory. The directory have to exist.
#'        The \code{NULL} (default) uses and creates
#'        'rqog' directory in the temporary directory from
#'        \code{\link{tempdir}}.
#' @param file.format A string. Specify the file format you want to download and import. Currently available \code{"csv"},\code{"dta"}, \code{"sav"} or \code{"xlsx"}.
#' @param download_only a logical whether to only download and save the dataset and skip importing in R.  Default is \code{FALSE}.
#' @param cache a logical whether to do caching. Default is \code{TRUE}.
#' @param update_cache a locigal whether to update cache. Default is \code{FALSE}.

#'  
#' @return data.frame 
#' 
#' @export
#' @examples # dat <- read_qog(which.data = "basic", data.dir="data")
#' @author Markus Kainu <markuskainu(at)gmail.com> 

read_qog <- function(which.data = "basic", data.type="time-series", data.dir = NULL, file.format = "csv",
                     download_only = FALSE,
                     cache = TRUE, update_cache = FALSE) {
  # Beginning of the URL's for all data's
  data.url.begin <- "http://www.qogdata.pol.gu.se/data/"

  if (!(which.data %in% c("basic","standard","std","oecd"))) stop('Wrong data name, use "basic","standard" or "oecd" instead')
  if (!(data.type %in% c("time-series","cross-sectional"))) stop('Wrong data name, use "time-series" or "cross-sectional" instead')
  
  if (file.format == "csv")  file_ext <- "csv"
  if (file.format == "dta")  file_ext <- "dta"
  if (file.format == "sav")  file_ext <- "sav"
  if (file.format == "xlsx") file_ext <- "xlsx"
  
  if (which.data == "basic")    dname <- "bas"
  if (which.data == "standard") dname <- "std"
  if (which.data == "std")      dname <- "std"
  if (which.data == "oecd")     dname <- "oecd"
  
  if (data.type == "cross-sectional") dtype <- "cs"
  if (data.type == "time-series")     dtype <- "ts"
  
  file.name <- paste0("qog_",dname,"_",dtype,"_jan18.",file_ext)
  
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
    
    data.url <- paste0(data.url.begin, file.name)
    message(paste("Local file not found. \n Downloading QoG",file.name,"data, \n",
                  "from",data.url,"\n in file:", cache_file,"\n", sep=" "))
    download.file(data.url, destfile = cache_file)

  }
  
  if (!download_only){
    
    if (cache & file.exists(cache_file)) {
      cf <- path.expand(cache_file)
      message(paste("Reading cache file", cf))
      # y <- readRDS(cache_file)
      if (file.format == "csv")  dd <- read.csv(cache_file, sep=",", stringsAsFactors = FALSE)
      if (file.format == "dta")  dd <- haven::read_dta(cache_file)
      if (file.format == "sav")  dd <- haven::read_sav(cache_file)
      if (file.format == "xlsx") dd <- readxl::read_excel(cache_file)
    }
    return(dd)
  }
  }

