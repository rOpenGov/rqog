\name{getQog}
\alias{getQog}
\title{Download data from Quality of Government Institute data}
\usage{
getQog(data = "basic", country = "all", indicator = "undp_hdi",
  year = "all", data.dir = "data")
}
\arguments{
  \item{data}{Character string. Name of the data. Either
  \code{"basic"}, \code{"standard"} or
  \code{"socialPolicy"}.}

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
\value{
data frame with 4 columns \itemize{ \item \code{cname}
Country name \item \code{year} Year of observation \item
\code{indicator} Name of the indicator \item
\code{value}Value of the indicator }
}
\description{
Download data from Quality of Government Institute Basic
data at \url{http://www.qog.pol.gu.se/data/}
}
\examples{
# dat <- getQog(data = "basic", country = c("Russia", "China"), indicator = c("undp_hdi", "fh_polity2"), year = 2000:2010)
}
\author{
Markus Kainu <markuskainu(at)gmail.com>
}

