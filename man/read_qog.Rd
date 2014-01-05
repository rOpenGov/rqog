\name{read_qog}
\alias{read_qog}
\title{Read Quality of Government Institute data in R}
\usage{
read_qog(which.data = "basic", data.dir = "~/tmp")
}
\arguments{
  \item{which.data}{A string. Specify the name of the QoG
  data set to retrieve. Currently available \code{"basic"},
  \code{"standard"} or \code{"social_policy"}.}

  \item{data.dir}{A string. Specify the path where to save
  the downloaded data file.}
}
\value{
data.frame
}
\description{
Download data from Quality of Government Institute Basic
data at \url{http://www.qog.pol.gu.se/data/}
}
\examples{
# dat <- read_qog(which.data = "basic", data.dir="data")
}
\author{
Markus Kainu <markuskainu(at)gmail.com>
}

