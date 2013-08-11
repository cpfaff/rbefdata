\name{bef.portal.get.metadata}
\alias{bef.portal.get.metadata}
\title{Get the metadata of a dataset from the BEFdata portal}
\usage{
  bef.portal.get.metadata(given)
}
\arguments{
  \item{given}{This is either a dataset id or a file path
  to a metadata eml file.}
}
\value{
  A list of metadata. metadata that doesn't exist is
  represented as \code{NA}
}
\description{
  This function fetches the metadata associated with a
  dataset on a BEFdata portal. You need to provide the id
  of the dataset. You can find the url on the dataset page.
}

