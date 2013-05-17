\name{bef.portal.get.attachment}
\alias{bef.portal.get.attachment}
\title{Download attachment files of a dataset in BEFdata portal}
\usage{
  bef.portal.get.attachment(dataset_id,
    user_credentials = bef.options("user_credentials"),
    dir = getwd(), curl = getCurlHandle(), ...,
    verbose = FALSE)
}
\arguments{
  \item{dataset_id}{the id of dataset}

  \item{user_credentials}{your login credentials}

  \item{dir}{the directory to store attachment files.
  default to the current working directory.}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint).}

  \item{\dots}{arguments passed to
  \code{\link[RCurl]{getURLContent}}.}

  \item{verbose}{boolean flag whether to display details
  about downloading. default to FALSE.  Note: this is a
  experimental feature.}
}
\value{
  a data frame of filenames and file descriptions are
  returned invisibly.
}
\description{
  This function will download attachment files associated
  with a dataset into specified directory.
}

