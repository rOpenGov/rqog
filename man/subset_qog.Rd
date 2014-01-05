\name{subset_qog}
\alias{subset_qog}
\title{Subset Quality of Government Institute data in R}
\usage{
subset_qog(country = c("Finland", "Sweden"), years = 2000:2010,
  indicator = c("undp_hdi", "fh_polity2"))
}
\arguments{
  \item{country}{Character string. Name of the country.
  Value \code{"all"} returns data from all the countries.}

  \item{year}{Numeric. Year or years (eg.
  (\code{c("2000:2003")}). Value \code{"all"} returns data
  from all the years available.}

  \item{indicator}{Character string. Select indicator from
  the \code{indicator} column of data frame returned by
  function \code{qogIndicator()}. More than one country or
  indicator is allowed using
  \code{c("indicator1","indicator2")}}
}
\description{
Subset Quality of Government Institute data in R
}

