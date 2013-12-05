# This file is part of the rustfare program (https://github.com/muuankarski/rustfare)

# Copyright (C) 2012-2013 Markus Kainu <markuskainu@gmail.com>. All rights reserved.

# This program is open source software; you can redistribute it and/or modify
# it under the terms of the FreeBSD License (keep this notice):
# http://en.wikipedia.org/wiki/BSD_licenses

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


#' List the currently available 
#' indicators from Quality of Governance database
#' 
#' List the currently available 
#' indicators from Quality of Governance database
#' \url{http://www.qog.pol.gu.se/data/datadownloads/qogstandarddata/}
#'
#' @param urli is the url address to the data
#'
#' @return string of names of available indicators
#' 
#' @export
#' @examples # available.indicators <- IndicatorQog()
#' @author Markus Kainu <markuskainu(at)gmail.com> 


IndicatorQogBasic <- function(urli = "http://www.qog.pol.gu.se/digitalAssets/1358/1358067_qog_tsd_csv_v6apr11.csv") {
  qog.l <- read.csv(urli, sep = ";")
  l <- colnames(qog.l)
  l
}


#' Download data from Quality of Governance data
#' 
#' Download data from Quality of Governance data at
#' \url{http://www.qog.pol.gu.se/data/datadownloads/qogstandarddata/}
#'
#' @param country Character string. Name of the country
#' @param indicator Character string. Select indicator from the \code{indicator} column 
#' of data frame returned by function \code{QogIndicator()}. More than one country or indicator 
#' is allowed using \code{c("indicator1","indicator2")}
#'  
#' @return data frame with 4 columns
#' \itemize{
#'  \item \code{cname} Country name
#'  \item \code{year} Year of observation
#'  \item \code{indicator} Name of the indicator
#'  \item \code{value}Value of the indicator
#'  }
#' 
#' @export
#' @examples # dat <- GetQog(country = c("Russia", "China"), indicator = c("undp_hdi", "fh_polity2"))
#' @author Markus Kainu <markuskainu(at)gmail.com> 

GetQogBasic <- function(country = "Russia", indicator = "undp_hdi") {
  if(!exists("qog.l")) {
    qog.l <- read.csv("http://www.qog.pol.gu.se/digitalAssets/1358/1358067_qog_tsd_csv_v6apr11.csv", 
                      sep = ";")
  }
  
  indicatorx <- c("cname","year",indicator)
  df <- subset(qog.l, 
               cname %in% c(country), 
               select = c(indicatorx))
  library(reshape2)
  df.l <- melt(df, id.vars=c("cname","year"))
  df.l <- df.l[!is.na(df.l$value), ]
  df.l$indicator <- df.l$variable
  df.l$variable <- NULL
  df.l
}