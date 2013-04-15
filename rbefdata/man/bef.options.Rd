\name{bef.options}
\alias{bef.options}
\title{Set or query BEFdata portal URL address and the Tematres thesaurus URL.}
\usage{
  bef.options(...)
}
\arguments{
  \item{\dots}{similar to \code{\link{options}}. see
  examples below.}
}
\description{
  This function is used to query and set R BEFdata package
  specific options.
}
\examples{
# query BEFdata portal URL
bef.options('url')
# set the URL
bef.options(url='http://www.example.com')
#Tematres url
bef.options('temtres_url')
bef.options(tematres_url="http://www.example.com")
}

