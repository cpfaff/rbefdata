#' Fetch keywords from a BEFdata portal.
#'
#' This function fetches keywords from a BEFdata portal.
#'
#' @return The function returns a character vector of keywords.
#'
#' @examples \dontrun{
#'             keywords=bef.portal.get.keywords()
#'           }
#' @import RCurl
#' @import rjson
#' @import XML
#' @export

bef.portal.get.keywords <- function()
   {
      keywords_json=fromJSON(getURL(paste0(bef.options('url'),"/keywords.json")))
      keywords_summary=unlist(lapply(keywords_json, function(x) (x$name)))
      return(keywords_summary)
   }
