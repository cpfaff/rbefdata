\name{bef.getdata}
\alias{bef.getdata}
\title{This is a wrapper to the getter functions of the befdata R package.}
\usage{
  bef.getdata(dataset_id, proposal_id, full_url,
    user_credentials)
}
\arguments{
  \item{dataset_id}{This is the id of a dataset on a
  BEFdata portal. You find the id in the url of the dataset
  or on the download page of the dataset.}

  \item{user_credentials}{This are the login credentials
  required to verify the users identity. They ensure you
  have the proper rights to download the data.}

  \item{full_url}{This option workds as direct download
  link. It can be used instead of the according ids. You
  can find the url either on the dataset download page for
  a dataset or on the proposal page for a proposal. Simply
  copy and paste it from the browser.}
}
\value{
  It returns a dataframe in case of a single dataset and a
  list of objects in case of a paper proposal. An error is
  thrown when the dataset or proposal is not found or you
  don't have the proper access right to perform the action.
}
\description{
  It returns contens depending on the on the parameters you
  provide to the function. It will fetch a dataset if you
  provide the id or even all dataset associated with a
  paper proposal based on the proposal id. You can even
  provide the function with a full url and it will fetch
  the right contents.
}
\examples{
\dontrun{
 dataset = bef.getdata(dataset_id=8, user_credentials="Yy2APsD87JiDbF9YBnU")
 proposal = bef.getdata(proposal_id=7, user_credentials="Yy2APsD87JiDbF9YBnU")
 dataset_full_url = bef.getdata(full_url = 'http://befdatadevelepment.biow.uni-leipzig.de/datasets/5/download.csv?seperate_category_columns=true&user_credentials=Yy2APsD87JiDbF9YBnU')
 }
}

