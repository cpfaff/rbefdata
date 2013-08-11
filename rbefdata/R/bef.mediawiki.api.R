#' Basic mediawik with one task to retrieve descriptions
#'
#' This function queries the wikipedie in the language of your choice. You
#' can select the language per two character country code wikipedia uses in
#' ther subdomains.
#'
#' @param term Is the term or string you are searching for on wikipedia
#' @param language The language of the wikipedia to use (default: en). You
#'  	  can use the two character country code wikipedia uses in their subdomains.
#' @return The function returns a vector with descriptions strings.
#' @examples \dontrun{
#' 		descriptions = bef.mediawiki.api.fetch.definition(term = "Tree")
#' 		descriptions = bef.mediawiki.api.fetch.definition(term = "Baum", language = "de")
#'	     }
#' @import RCurl
#' @import XML
#' @export bef.mediawiki.api.fetch.definition

bef.mediawiki.api.fetch.definition <- function(term, language="en") {
      wiki_api_url= paste0("http://", language, ".wikipedia.org/w/api.php")
	search_return <- getForm(
	  wiki_api_url,
	  action  = "opensearch",
	  search  = term,
	  format  = "xml",
	  .opts   = ""
	)
	document = xmlTreeParse(search_return, useInternalNodes=TRUE)
	document_root = xmlRoot(document)
	nodeset = getNodeSet(document_root, "//xmlns:Description", "xmlns")
	descriptions = xmlSApply(nodeset, xmlValue)
	cleaned_descriptions = sapply(descriptions, function(x) clean_html_string(x), USE.NAMES=F)
	return(cleaned_descriptions)
}
