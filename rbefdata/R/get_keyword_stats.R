#' Fetch keywords from a BEFdata portal.
#'
#' This function fetches all keywords which are used from a BEFdata portal.
#'
#' @param curl You can pass in a curl handle with additional options. By default a curl handle is
#'        used to improve the memory footprint.
#' @param \dots Arguments passed to \code{\link[RCurl]{getURLContent}}
#'
#' @return The function returns a data frame of keyword (id, name, count).
#'
#' @examples
#' \dontrun{
#' keywords <- rbefdata::get_keyword_stats()
#' }
#' @import RCurl
#' @import XML
#' @importFrom tibble as_tibble
#' @export get_keyword_stats

get_keyword_stats <- function(curl = getCurlHandle(), ...) {
  raw_keywords_xml <- getURL(paste0(bef_options("url"), "/keywords.xml"), curl = curl, ...)
  if (getCurlInfo(curl)$response.code != 200) stop("Server Error. Try again later!")
  keywords_xml <- xmlTreeParse(raw_keywords_xml, useInternalNodes = T)
  data_frame_keywords <- xmlToDataFrame(keywords_xml, colClasses = c("numeric", "character", "numeric"), stringsAsFactors = FALSE)
  names(data_frame_keywords) <- c("id", "keyword", "dataset_count")
  return(as_tibble(data_frame_keywords))
}
