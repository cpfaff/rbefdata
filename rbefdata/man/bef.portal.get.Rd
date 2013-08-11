\name{bef.portal.get}
\alias{bef.portal.get}
\title{This is a wrapper for the getter functions of the BEFdata R package.}
\usage{
  bef.portal.get(dataset_id, metadata)
}
\arguments{
  \item{dataset_id}{This is the id of a dataset on a
  BEFdata portal. You find the id in the url of the dataset
  or on the download page of the dataset.}

  \item{metadata}{Can be either a file path or the id of a
  dataset.}
}
\value{
  The function returns a dataframe in case of a single
  dataset and a list of objects in case of a paper proposal
  as well as for multiple datasets defined via ids. An
  error is thrown when the dataset or proposal is not found
  or you don't have the proper access right to perform the
  action. For detailed informations about the used
  functions see \code{\link{bef.portal.get.dataset}} and
  \code{\link{bef.portal.get.proposal}}.
}
\description{
  It returns contents depending on the on the parameters
  you provide to the function. It will fetch a dataset if
  you provide the id. If you provide a proposal id it will
  fetch all datasets associated with that proposal. You can
  even provide the function with a full URL of either of
  them and it will fetch the right contents by parsing the
  URL.
}
\examples{
\dontrun{
     dataset = bef.portal.get(dataset_id = 8)
     metadata = bef.portal.get(metadata = "/path/to/21.eml")
     metadata = bef.portal.get(metadata = 21)
 }
}

