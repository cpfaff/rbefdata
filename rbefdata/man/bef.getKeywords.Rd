\name{bef.getKeywords}
\alias{bef.getKeywords}
\title{Fetch keywords from a befdata portal.}
\usage{
  bef.getKeywords()
}
\value{
  The function returns a character vector of keywords.
}
\description{
  This function fetches keywords from a BEFdata portal. It
  also enables the task of fetching all datasets assiciated
  with one, or a list of keywords. It delegates the task of
  fething multiple datasets to bef.getDataset which returns
  a dataframe for one dataset and a list element if there
  are multiple datasets available. An error is thrown when
  dataset is not found or you don't have the proper access
  right for it. l datasets associated with one, or a list
  of keywords.
}
\examples{
\dontrun{
            keywords=bef.getKeywords()
          }
}

