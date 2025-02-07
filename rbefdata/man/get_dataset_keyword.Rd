% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_dataset_keyword.R
\name{get_dataset_keyword}
\alias{get_dataset_keyword}
\title{Fetch keywords from a BEFdata portal.}
\usage{
get_dataset_keyword(curl = getCurlHandle(), ...)
}
\arguments{
\item{curl}{You can pass in a curl handle with additional options. By default a curl handle is
used to improve the memory footprint.}

\item{\dots}{Arguments passed to \code{\link[RCurl]{getURLContent}}}
}
\value{
The function returns a data frame of keyword (id, name, count).
}
\description{
This function fetches all keywords which are used from a BEFdata portal.
}
\examples{
\dontrun{
keywords <- bef.portal.get.keywords()
}
}
