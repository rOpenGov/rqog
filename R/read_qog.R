# This file is part of the rQog-package (https://github.com/muuankarski/rqog)

# Copyright (C) 2012-2013 Markus Kainu <markuskainu@gmail.com>. All rights reserved.

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
#' @param which.data A string. Specify the name of the QoG data set to retrieve. Currently available \code{"basic"}, \code{"standard"} or \code{"social_policy"}.
#' @param data.dir A string. Specify the path where to save the downloaded data file.
#'  
#' @return data.frame 
#' 
#' @export
#' @examples # dat <- read_qog(which.data = "basic", data.dir="data")
#' @author Markus Kainu <markuskainu(at)gmail.com> 

read_qog <- function(which.data = "basic", data.dir = "~/tmp") {
        # Beginning of the URL's for all data's
        data.url.begin <- "http://www.qogdata.pol.gu.se/data/"
        # local csv that will be read
        if (which.data == "basic")          name.csv <- "qog_bas_ts_30aug13.csv"
        if (which.data == "standard")       name.csv <- "qog_std_ts_15may13.csv"
        if (which.data == "social_policy")  name.csv <- "qog_soc_tsl_4apr12.csv"        
        # creating local file path
        local.path <- file.path(data.dir, name.csv)
        # Check whether to local file exist.
        # If it does not exist then download it
        if (!file.exists(local.path) == TRUE) {
             # create local folder if it is missing
            if (!file.exists(data.dir)) dir.create(data.dir)
            # Create the web address from where to fetch the csv
            data.url <- paste(data.url.begin, name.csv, sep = "")
            message(paste("Local file not found.
Downloading QoG ",which.data," data 
from ",data.url, " 
in file: ", local.path," 
-----------------------------------
-----------------------------------", sep=""))
            download.file(data.url, destfile = local.path)
     }
    # read the local file in every case
    message(paste("Reading local file from ",local.path, sep=""))
    read.csv(local.path, sep=";")
}


