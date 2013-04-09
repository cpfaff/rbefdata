\docType{data}
\name{dataset_id}
\alias{dataset_id}
\title{Fetch primary data in csv format from a BEFdata portal}
\format{num 7}
\usage{
  dataset_id
}
\arguments{
  \item{dataset_id}{is the id of a dataset in a BEFdata
  portal.}

  \item{user_credentials}{your login credentials}

  \item{full_url}{as direct download link instead of the
  id. you can find it on the dataset show page.}

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
  This function fetches data from of a BEFdata portal
  dataset. By default it will fetch the CSV file of a
  dataset. You need to provide the function with a dataset
  id which you can find in the URL of the file on the
  BEFdata portal and your user credentials. You can find
  the credentials inside your profile on the BEFdata
  portal. The credentials ensure you have the rights to
  download the data. The function returns a dataset object
  which you can store into a variable as shown in the
  examples below. The object also offers additional
  information by attributes. You can querry the information
  via the attributes function as shown in the examples
  below.
}
\examples{
\dontrun{
 dat1 = bef.getdata(dataset_id=8, user_credentials="Yy2APsD87JiDbF9YBnU")
 attributes(dat1)
 dat2 = bef.getdata(full_url = 'http://befdatadevelepment.biow.uni-leipzig.de/datasets/5/download.csv?seperate_category_columns=true&user_credentials=Yy2APsD87JiDbF9YBnU')
 attributes(dat2)$authors
 }
}
\keyword{datasets}

