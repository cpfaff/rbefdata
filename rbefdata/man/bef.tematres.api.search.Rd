\name{bef.tematres.api.search}
\alias{bef.tematres.api.search}
\title{A tematres base api based function to search the server}
\usage{
  bef.tematres.api.search(keyword, task = "search")
}
\arguments{
  \item{keyword}{The keyword you are looking for}

  \item{task}{Defines behavior on search. Defaults to
  "search" but can also be "broader" (look for upward
  definitions) and "narrower" (looking for downward
  definitions).}
}
\value{
  The function returns a vector of keywords
}
\description{
  Search a Tematres thesaurus via keywords. This function
  is a wrapper and so it calls the appropriate funtions
  depending on the search task.
}

