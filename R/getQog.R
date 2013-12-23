# This file is part of the rQog-package (https://github.com/muuankarski/rqog)

# Copyright (C) 2012-2013 Markus Kainu <markuskainu@gmail.com>. All rights reserved.

# This program is open source software; you can redistribute it and/or modify
# it under the terms of the FreeBSD License (keep this notice):
# http://en.wikipedia.org/wiki/BSD_licenses

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


#' Retrieve Quality of Government Institute data
#' 
#' Download data from Quality of Government Institute Basic data at
#' \url{http://www.qog.pol.gu.se/data/}
#'
#' @param which.data A string. Specify the name of the QoG data set to retrieve. Currently available \code{"basic"}, \code{"standard"} or \code{"socialPolicy"}.
#' @param data.dir A string. Specify the path where to save the downloaded data file.

#'  
#' @return ??
#' 
#' @export
#' @examples # dat <- getQog(data = "basic", country = c("Russia", "China"), indicator = c("undp_hdi", "fh_polity2"), year = 2000:2010)
#' @author Markus Kainu <markuskainu(at)gmail.com> 


getQog <- function(which.data = "basic", data.dir = "data") {
    # URL's for different data's
    data.url <- "http://www.qogdata.pol.gu.se/data/"
    
    # Create data.fir if does not exist
    if (!file.exists(data.dir)) dir.create(data.dir)
    
    if (which.data == "basic") {
        # Remote csv that will be downloaded
        remote.csv <- "qog_bas_ts_30aug13.csv"
        # Location and name of the csv file that will be saved on the local computer
        local.csv <- file.path(data.dir, remote.csv)
        # Create the web address from where to fetch the zip
        data.url <- paste(data.url, remote.csv, sep = "")
        message(paste("Dowloading QoG Basic data data from ", data.url, "in file", local.csv))
        download.file(data.url, destfile = local.csv)
    }
    
    if (which.data == "standard") {
        # Remote csv that will be downloaded
        remote.csv <- "qog_std_ts_15may13.csv"
        # Location and name of the csv file that will be saved on the local computer
        local.csv <- file.path(data.dir, remote.csv)
        # Create the web address from where to fetch the zip
        data.url <- paste(data.url, remote.csv, sep = "")
        message(paste("Dowloading QoG Standard data data from ", data.url, "in file", local.csv))
        download.file(data.url, destfile = local.csv)
    }
    
    if (which.data == "socialPolicy") {
        # Remote csv that will be downloaded
        remote.csv <- "qog_soc_tsl_4apr12.csv"
        # Location and name of the csv file that will be saved on the local computer
        local.csv <- file.path(data.dir, remote.csv)
        # Create the web address from where to fetch the zip
        data.url <- paste(data.url, remote.csv, sep = "")
        message(paste("Dowloading QoG Social Policy data data from ", data.url, "in file", local.csv))
        download.file(data.url, destfile = local.csv)
    }

}
