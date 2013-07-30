\name{bef.portal.upload.dataset}
\alias{bef.portal.upload.dataset}
\title{Upload a dataset to the BEFdata portal}
\usage{
  bef.portal.upload.dataset(dataset_title, dataset_object,
    file_path, curl = getCurlHandle())
}
\arguments{
  \item{dataset_title}{The title of the dataset.}

  \item{dataset_object}{The data frame you like to upload
  as dataset.}

  \item{file_path}{The path to a CSV file for upload as
  dataset.}

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

