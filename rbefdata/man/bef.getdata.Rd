\name{bef.getdata}
\alias{bef.getdata}
\title{Fetch primary data in csv format from a BEFdata portal}
\usage{
  bef.getdata(dataset_id, user_credential, full_url,
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{dataset_id}{id of a dataset in a BEFdata portal.}

  \item{user_credential}{your login credential}

  \item{full_url}{use as direct download link instead the
  id. you can find it in the dataset show page.}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{\dots}{other arguments passed to
  \code{\link[RCurl]{getURLContent}}}
}
\value{
  a dataframe. Error is thrown when dataset is not found or
  you don't have the proper access right for it.
}
\description{
  This function fetches data from a dataset of a BEFdata
  portal. By default it will fetch the CSV file of a
  dataset. You need to provide the function with a dataset
  id which you can find in the URL of the file on the
  BEFdata portal and your user credentials to ensure you
  have the rights to download the data. You can find your
  user credentials in your user profile of the BEFdata
  portal. You can save the data into a variable like in the
  example below. The function returns a dataset object
  which has additional information you can querry via the
  attributes function. So you can get the authors and
  descriptions as shown in the example below.
}
\examples{
\dontrun{
 dat1 = bef.getdata(dataset_id=8, user_credential="Yy2APsD87JiDbF9YBnU")
 attributes(dat1)
 dat2 = bef.getdata(full_url = 'http://befdatadevelepment.biow.uni-leipzig.de/datasets/5/download.csv?seperate_category_columns=true&user_credentials=Yy2APsD87JiDbF9YBnU')
 attributes(dat2)$authors
 }
}

