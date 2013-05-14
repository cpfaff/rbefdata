#' A wrapper for the search on the tematres thesaurus.
#'
#' Search a Tematres thesaurus via keywords. This function is a wrapper and so it calls
#' the appropriate funtions depending on the search task.
#'
#' @param lookup_keyword The keyword you are looking for
#' @param search_task Defines behavior on search. Defaults to "search" but can also be
#'        "broader" (look for upward definitions) and "narrower" (looking for downward definitions).
#'
#' @return The function returns a vector of keywords
#' @import RCurl
#' @import XML
#' @export

bef.search.tematres <- function(lookup_keyword, search_task="search") {
  if (search_task=="search")
    {
      results=bef.search.tematres.keywords(lookup_keyword=lookup_keyword)
      return(results)
    }
  if (search_task=="broader")
    {
      results=bef.search.tematres.broader_keywords(lookup_keyword=lookup_keyword)
      return(results)
    }
  if (search_task=="narrower")
    {
      results=bef.search.tematres.narrower_keywords(lookup_keyword=lookup_keyword)
      return(results)
    }
}
