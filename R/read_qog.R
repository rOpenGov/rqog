# This file is part of the rQog-package (https://github.com/muuankarski/rqog)

# Copyright (C) 2012-2017 Markus Kainu <markuskainu@gmail.com>. All rights reserved.

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
#' @param data.dir A string. Specify the path where to save the downloaded data file.
#' @param file.format A string. Specify the file format you want to download and import. Currently available \code{"csv"},\code{"dta"}, \code{"sav"} or \code{"xlsx"}.
#'  
#' @return data.frame 
#' 
#' @export
#' @examples # dat <- read_qog(which.data = "basic", data.dir="data")
#' @author Markus Kainu <markuskainu(at)gmail.com> 

read_qog <- function(which.data = "basic", data.type="time-series", data.dir = "~/tmp", file.format = "csv") {
        # Beginning of the URL's for all data's
        data.url.begin <- "http://www.qogdata.pol.gu.se/data/"
        
        if (!(which.data %in% c("basic","standard","oecd"))) stop('Wrong data name, use "basic","standard" or "oecd" instead')
        if (!(data.type %in% c("time-series","cross-sectional"))) stop('Wrong data name, use "time-series" or "cross-sectional" instead')
        
        if (file.format == "csv")  file_ext <- "csv"
        if (file.format == "dta")  file_ext <- "dta"
        if (file.format == "sav")  file_ext <- "sav"
        if (file.format == "xlsx") file_ext <- "xlsx"
        
        if (which.data == "basic")    dname <- "bas"
        if (which.data == "standard") dname <- "std"
        if (which.data == "oecd")     dname <- "oecd"
        
        if (data.type == "cross-sectional") dtype <- "cs"
        if (data.type == "time-series")     dtype <- "ts"
        
        file.name <- paste0("qog_",dname,"_",dtype,"_jan17.",file_ext)
        
        # creating local file path
        local.path <- file.path(data.dir, file.name)
        # Check whether to local file exist.
        # If it does not exist then download it
        if (!file.exists(local.path)) {
             # create local folder if it is missing
            if (!file.exists(data.dir)) dir.create(data.dir)
            # Create the web address from where to fetch the csv
            data.url <- paste0(data.url.begin, file.name)
            message(paste("Local file not found. \n Downloading QoG",file.name,"data, \n",
                              "from",data.url,"\n in file:", local.path,"\n", sep=" "))
            download.file(data.url, destfile = local.path)
     }
    # read the local file in every case
    message(paste("Reading local file from ",local.path, sep=""))
    
    if (file.format == "csv")  dd <- read.csv(local.path, sep=",", stringsAsFactors = FALSE)
    if (file.format == "dta")  dd <- haven::read_dta(local.path)
    if (file.format == "sav")  dd <- haven::read_sav(local.path)
    if (file.format == "xlsx") dd <- readxl::read_excel(local.path)
    return(dd)
    # readr::read_csv(local.path)
    }


