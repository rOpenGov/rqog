# This file is part of the rQog-package (https://github.com/muuankarski/rqog)

# Copyright (C) 2012-2013 Markus Kainu <markuskainu@gmail.com>. All rights reserved.

# This program is open source software; you can redistribute it and/or modify
# it under the terms of the FreeBSD License (keep this notice):
# http://en.wikipedia.org/wiki/BSD_licenses

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


#' List the currently available 
#' indicators from Quality of Government Institute Standard data
#' 
#' List the currently available 
#' indicators from Quality of Government Institute Standard data
#' \url{http://www.qog.pol.gu.se/data/datadownloads/qogstandarddata/}
#'
#' @param urli is the url address to the data
#'
#' @return string of names of available indicators
#' 
#' @export
#' @examples # available.indicators <- indicatorQogStandard()
#' @author Markus Kainu <markuskainu(at)gmail.com> 


indicatorQogStandard <- function(urli = "http://www.qogdata.pol.gu.se/data/qog_std_ts_15may13.csv") {
  qog.l <- read.csv(urli, sep = ";")
  l <- colnames(qog.l)
  l
}


#' Download data from Quality of Government Institute Standard data
#' 
#' Download data from Quality of Government Institute Standard data at
#' \url{http://www.qog.pol.gu.se/data/datadownloads/qogstandarddata/}
#'
#' @param country Character string. Name of the country. Value \code{"all"} returns data from all the countries.
#' @param year Numeric. Year or years (eg. (\code{c("2000:2003")}). Value \code{0} returns data from all the years available.
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
#' @examples # dat <- getQogStandard(country = c("Russia", "China"), indicator = c("undp_hdi", "fh_polity2"))
#' @author Markus Kainu <markuskainu(at)gmail.com> 

getQogStandard <- function(country = "all", 
                           indicator = "undp_hdi",
                           year = 0) {
  qog <- read.csv("http://www.qogdata.pol.gu.se/data/qog_std_ts_15may13.csv", 
                      sep = ";")
  
  if (country != "all") df <- qog[qog$cname %in% c(country), ]
  if (country == "all") df <- qog

  indicatorx <- c("cname","year",indicator)
  df <- df[, c(indicatorx)]
  library(reshape2)
  df.l <- melt(df, id.vars=c("cname","year"))
  df.l <- df.l[!is.na(df.l$value), ]
  df.l$indicator <- df.l$variable
  df.l$variable <- NULL
  if (year != 0) df.l <- df.l[df.l$year == year,]
  if (year == 0) df.l <- df.l
  df.l
}