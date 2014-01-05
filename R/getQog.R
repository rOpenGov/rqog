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
#' Download data from Quality of Government Institute data at
#' \url{http://www.qog.pol.gu.se/data/}
#'
#' @param which.data A string. Specify the name of the QoG data set to retrieve. Currently available \code{"basic"}, \code{"standard"} or \code{"social_policy"}.
#' @param data.dir A string. Specify the path where to save the downloaded data file.
#'  
#' @return ??
#' 
#' @export
#' @examples # get_qog(which.data="basic",data.dir="data")
#' @author Markus Kainu <markuskainu(at)gmail.com> 

get_qog <- function(which.data = "basic", data.dir = "~/tmp") {
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
    
    if (which.data == "social_policy") {
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

#' Read Quality of Government Institute data in R
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
    if (which.data == "basic") {
        # local csv that will be read
        local.csv <- "qog_bas_ts_30aug13.csv"
        # local data directory
        local.path <- file.path(data.dir, local.csv)
    }
            
    if (which.data == "standard") {
        # local csv that will be read
        local.csv <- "qog_std_ts_15may13.csv"
        # local data directory
        local.path <- file.path(data.dir, local.csv)
    }
    
    if (which.data == "social_policy") {
        # local csv that will be read
        local.csv <- "qog_soc_tsl_4apr12.csv"
        # local data directory
        local.path <- file.path(data.dir, local.csv)
    }
    if (file.exists(local.path) == FALSE){
        stop(paste(local.csv," file does not exist in ",
                   data.dir, " folder. Make sure you have downloaded the file using get_qog() and check the directory.",sep=""))
    }
    # read the file
    message(paste("Reading file from ",local.path, sep=""))
    read.csv(local.path, sep=";")
        
}



#' Subset Quality of Government Institute data in R
#'
#' @param country Character string. Name of the country. Value \code{"all"} returns data from all the countries.
#' @param year Numeric. Year or years (eg. (\code{c("2000:2003")}). Value \code{"all"} returns data from all the years available.
#' @param indicator Character string. Select indicator from the \code{indicator} column 
#' of data frame returned by function \code{qogIndicator()}. More than one country or indicator 
#' is allowed using \code{c("indicator1","indicator2")}


subset_qog <- function(object.name="dat",
                       country=c("Finland","Sweden"),
                       years=2000:2010,
                       indicator=c("undp_hdi","fh_polity2")) {
    if (exists("dat") == FALSE) {
        stop("Object dat does not exist!")
    }
    # subset the countries
    if (country != "all") df <- dat[dat$cname %in% country, ]
    if (country == "all") df <- dat
    # subset the variables
    indicatorx <- c("cname","year",indicator)
    df <- df[indicatorx]
    # reshape the data into long format  
    library(reshape2)
    df.l <- melt(df, id.vars=c("cname","year"))
    df.l <- df.l[!is.na(df.l$value), ]
    names(df.l)[3] <- "variable"
    # subset the years
    df.l$year <- as.numeric(df.l$year)
    if (years != "all") df.l <- df.l[df.l$year %in% years,]
    if (years == "all") df.l <- df.l
    df.l
}

