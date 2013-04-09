\name{bef.getProposal}
\alias{bef.getProposal}
\title{Fetch primary data in csv format from a BEFdata portal paperproposal}
\usage{
  bef.getProposal(proposal_id, user_credentials, full_url,
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{proposal_id}{This is the id of a paper proposal.
  You can download all datasets in one turn given the
  proposal_id and your user credentials.}

  \item{user_credentials}{your login credentials}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{\dots}{other arguments passed to
  \code{\link[RCurl]{getURLContent}}}
}
\value{
  a list. Error is thrown when proposal is not found or you
  don't have the proper access right for it.
}
\description{
  This function fetches data from of a BEFdata portal
  paperproposal. By default it will fetch all associated
  CSV files of a paperproposal next to the informations
  available like the title, urls and the id of the
  datasets. You need to provide the function with a
  proposal id which you can find in the URL of the proposal
  on the BEFdata portal and your user credentials. You can
  find the credentials inside your profile on the BEFdata
  portal. The credentials ensure you have the rights to
  download the data. The function returns a list object
  which you can store into a variable as shown in the
  examples below.
}
\examples{
\dontrun{
 prop1 = bef.getproposal(proposal_id=8, user_credentials="Yy2APsD87JiDbF9YBnU")
 prop1
 }
}

