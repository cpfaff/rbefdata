\name{bef.getdata}
\alias{bef.getdata}
\title{This function is a wrapper to the getter functions of the befdata R package.}
\usage{
  bef.getdata(dataset_id = NULL, proposal_id = NULL,
    full_url = NULL, user_credentials = NULL,
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{dataset_id}{This is the id of a dataset in a
  BEFdata portal.}

  \item{user_credentials}{This are the login credentials
  required to verify the user has the proper rights to
  download the data.}

  \item{full_url}{This functions as direct download link
  and can be used instead of the ids. you can find the url
  on the dataset download page for a dataset and on the
  proposal page for a proposal copy it simply from the
  browser.}

  \item{curl}{If the function is used in a loop, call
  getCurlHandle() first and pass the returned value in here
  (avoids unnecessary footprint).}

  \item{\dots}{This are other arguments passed to
  \code{\link[RCurl]{getURLContent}}}
}
\value{
  a dataframe. An error is thrown when the dataset is not
  found or you don't have the proper access right to
  perform the action.
}
\description{
  It depends on the parameters you provide to the function
  it will fetch the complete data for a paperproposal,
  single datasets or only the metadata for a dataset.
}
\examples{
\dontrun{
 dat1 = bef.getdata(dataset_id=8, user_credentials="Yy2APsD87JiDbF9YBnU")
 attributes(dat1)
 dat2 = bef.getdata(full_url = 'http://befdatadevelepment.biow.uni-leipzig.de/datasets/5/download.csv?seperate_category_columns=true&user_credentials=Yy2APsD87JiDbF9YBnU')
 attributes(dat2)$authors
 }
}

