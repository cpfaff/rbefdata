\name{bef.portal.upload.dataset}
\alias{bef.portal.upload.dataset}
\title{Upload a dataset to the BEFdata portal}
\usage{
  bef.portal.upload.dataset(title, dataset,
    curl = getCurlHandle())
}
\arguments{
  \item{title}{The title of the dataset.}

  \item{dataset}{The data you like to upload as dataset.
  This can be a path to a CSV file or a data frame.}

  \item{curl}{You can pass in a curl handle with additional
  options.}
}
\value{
  Returns a status message with the ID of the dataset (not
  yet).
}
\description{
  This function uploads a dataset from within R to a
  BEFdata portal set in your options. Before you can do so
  you need to have an account on the portal and set your
  credentials via the bef.options() function so the
  authentication works. The function requires a title for
  the dataset and either a path to a CSV file for for
  upload or a dataset object. The dataset must have unique
  column names.
}

