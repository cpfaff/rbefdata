\name{bef.getDataset}
\alias{bef.getDataset}
\title{Fetch primary data in csv format from a BEFdata portal dataset.}
\usage{
  bef.getDataset(dataset_id, user_credentials, full_url,
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{dataset_id}{This is the id of a dataset on a
  BEFdata portal.}

  \item{user_credentials}{This are your login credentials.}

  \item{full_url}{This functions as direct download link
  which you can use instead of the id. You can find it on
  the dataset page or the dataset download page.}

  \item{curl}{If the function is used inside a loop, call
  getCurlHandle() first and pass the returned value in
  here. This avoids an unnecessary footprint.}

  \item{\dots}{This are other arguments passed to
  \code{\link[RCurl]{getURLContent}}}
}
\value{
  The function returns a dataframe. An error is thrown when
  dataset is not found or you don't have the proper access
  right for it.
}
\description{
  This function fetches data associated with a BEFdata
  portal dataset. By default it will fetch the CSV file of
  a dataset. You need to provide the function with a
  dataset id which you can find in the URL of the dataset
  on the BEFdata portal and your user credentials. You can
  find the credentials inside your profile on the BEFdata
  portal. The credentials ensure you have the rights to
  download the data. The function returns a dataset object
  which you can store into a variable as shown in the
  examples below. The object also offers additional
  information by attributes. You can querry the information
  via the attributes() function as shown in the examples
  below.
}
\examples{
\dontrun{
             datset1 = bef.getDataset(dataset_id=8,
             user_credentials="Yy2APsD87JiDbF9YBnU")

             attributes(datset1) dataset2 = bef.getDataset(full_url =
             'http://befdatadevelepment.biow.uni-leipzig.de/datasets/5/download.csv?sepera
             te_category_columns=true&user_credentials=Yy2APsD87JiDbF9YBnU')

             attributes(dataset2)$author
          }
}

