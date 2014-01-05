\name{get_qog}
\alias{get_qog}
\title{Retrieve Quality of Government Institute data}
\usage{
get_qog(which.data = "basic", data.dir = "~/tmp", cache = TRUE)
}
\arguments{
  \item{which.data}{A string. Specify the name of the QoG
  data set to retrieve. Currently available \code{"basic"},
  \code{"standard"} or \code{"social_policy"}.}

  \item{data.dir}{A string. Specify the path where to save
  the downloaded data file.}
}
\value{
??
}
\description{
Download data from Quality of Government Institute data at
\url{http://www.qog.pol.gu.se/data/}
}
\examples{
# get_qog(which.data="basic",data.dir="data")
}
\author{
Markus Kainu <markuskainu(at)gmail.com>
}

