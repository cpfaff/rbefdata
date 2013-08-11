\name{bef.mediawiki.api.fetch.definition}
\alias{bef.mediawiki.api.fetch.definition}
\title{Basic mediawik with one task to retrieve descriptions}
\usage{
  bef.mediawiki.api.fetch.definition(term, language = "en")
}
\arguments{
  \item{term}{Is the term or string you are searching for
  on wikipedia}

  \item{language}{The language of the wikipedia to use
  (default: en). You can use the two character country code
  wikipedia uses in their subdomains.}
}
\value{
  The function returns a vector with descriptions strings.
}
\description{
  This function queries the wikipedie in the language of
  your choice. You can select the language per two
  character country code wikipedia uses in ther subdomains.
}
\examples{
\dontrun{
		descriptions = bef.mediawiki.api.fetch.definition(term = "Tree")
		descriptions = bef.mediawiki.api.fetch.definition(term = "Baum", language = "de")
	     }
}

