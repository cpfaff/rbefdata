#' Fetch a list of datasets for a keyword
#'
#' This function fetches a list of datasets associated with a BEFdata portal keyword.
#'
#' @param keyword The keyword you like to fetch the associated datasets for
#' @param keyword_id This is the id of the keyword
#'
#' @examples \dontrun{
#'         list = bef.portal.get.dataset_list(keyword="carbon")
#'         list = bef.portal.get.dataset_list(keyword_id=47)
#'       }
#' @aliases bef.get.dataset_list
#' @import RCurl
#' @import rjson
#' @export

bef.portal.get.dataset_list <- bef.get.dataset_list <- function(keyword, keyword_id) {

  keyword_json = fromJSON(getURL(paste0(bef.options('url'),"/keywords.json")))
  names = unlist(lapply(keyword_json, function(x) (x$name)))
  ids = unlist(lapply(keyword_json, function(x) (x$id)))
  keyword_summary = data.frame(key = names, id = ids)

  if(!missing(keyword_id)) {
    url = keyword_url(id=keyword_id)
    full_url = paste(url, ".csv", sep = "")
    dataset_list = read.csv(full_url)
    output = data.frame(id=dataset_list$id, title=dataset_list$title)
    return(output)
  }

  if(!missing(keyword)) {
    grep_matches <- c(keyword)
    matches <- unique(grep(paste(grep_matches,collapse="|"), keyword_summary$key, value=TRUE))
    position = which(keyword_summary$key %in% matches)
    get_keyword_id = keyword_summary$id[position]
    keyword_datasets_api_list = (unique(unlist(lapply(get_keyword_id, function(x) paste0(keyword_url(x),".csv")))))
    dataset_list = keyword_datasets_api_list
    dataset_info = lapply(dataset_list, function(x) read.csv(x)[,1:2])
    titles = unique(unlist(lapply(dataset_info, function(x) x$title)))
    ids = unique(unlist(lapply(dataset_info, function(x) x$id)))
    id_title_df = data.frame(dataset_id = ids, dataset_titles = titles)
    if (dim(id_title_df)[1] == 0 ) {
      # here search the thesaurus give alternatives above below and partial mathings
      print("The following keywords are available that are close to your search term:")
      (bef.tematres.search.broader_keywords(lookup_keyword = keyword))
    } else {
      return(id_title_df)
    }
  }
}
