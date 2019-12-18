#' Fetch a list of datasets for a keyword
#'
#' This function fetches a list of datasets associated with a BEFdata portal keyword.
#'
#' @param keyword The keyword you like to fetch the associated datasets for
#'
#' @examples
#' \dontrun{
#' list <- bef.portal.get.datasets.for_keyword(keyword = "carbon")
#' }
#' @import RCurl
#' @import rjson
#' @importFrom tibble as_tibble
#' @export get_dataset_by_keyword 

# TODO: deprecate these
# * bef.portal.get.datasets.for_keyword 
# * bef.get.datasets.for_keyword

# public ui

get_dataset_by_keyword <- function(input){
  if(length(input) > 1){
    lapply(input, function(index){private_get_dataset_by_keyword(input)})
  } else {
    private_get_dataset_by_keyword(input)
  }
}

# private 

private_get_dataset_by_keyword <- function(keyword) {
  keyword_json <- fromJSON(getURL(paste0(bef.options("url"), "/keywords.json")))
  names <- unlist(lapply(keyword_json, function(x) (x$name)))
  ids <- unlist(lapply(keyword_json, function(x) (x$id)))
  keyword_summary <- data.frame(key = names, id = ids)

  if (!missing(keyword)) {
    grep_matches <- c(keyword)
    matches <- unique(grep(paste(grep_matches, collapse = "|"), keyword_summary$key, value = TRUE))
    position <- which(keyword_summary$key %in% matches)
    get_keyword_id <- keyword_summary$id[position]
    keyword_datasets_api_list <- (unique(unlist(lapply(get_keyword_id, function(x) paste0(keyword_url(x), ".csv")))))
    dataset_list <- keyword_datasets_api_list
    dataset_info <- lapply(dataset_list, function(x) read.csv(x)[, 1:2])
    titles <- unique(unlist(lapply(dataset_info, function(x) x$title)))
    ids <- unique(unlist(lapply(dataset_info, function(x) x$id)))
    id_title_df <- data.frame(id = ids, title = titles)
    if (dim(id_title_df)[1] == 0) {
      print("Sorry no datasets are tagged with this keyword!")
    } else {
      return(as_tibble(id_title_df))
    }
  }
}
