#' Fetch primary from a BEFdata portal paperproposal
#'
#' This function fetches data from a paperproposal on a BEFdata portal. This
#' allows a fast import of your data into R to start with your analysis. You
#' need to provide the function with a proposal id which you can find in the
#' URL of the proposal. 
#'
#' @param id This is the ID of the paper proposal you want to get 
#'
#' @param split_category Determines whether columns with mixed data types are split
#'        into two separate numeric and factorial columns
#'
#' @return The function returns a list of the datasetsattached to a proposal. 
#'
#' @examples
#' \dontrun{
#'      prop1 <- get_proposal_dataset(id = 8)
#' }
#' @import RCurl
#' @importFrom tibble as_tibble
#' @export get_proposal_dataset

# public ui

get_proposal_dataset <- function(id, split_category = T){
  curl = getCurlHandle()
  if(length(id) > 1){
    lapply(id, function(index){private_get_proposal_dataset(id = index, curl = curl, split_category = split_category)})
  } else {
    private_get_proposal_dataset(id = id, curl = curl, split_category = split_category)
  }
}

# private

private_get_proposal_dataset <- function(id, split_category = T, curl = getCurlHandle()) {
  paperproposal_url <- paperproposal_url(proposal_id = id)
  proposal_raw_csv <- getURL(paperproposal_url, curl = curl)

  if (getCurlInfo(curl)$response.code != 200) {
    stop("Proposal not found or not accessible. Please check your credentials and make sure you have access right for it.")
  }
  proposal_data <- read.csv(text = proposal_raw_csv)
  datasets <- lapply(proposal_data$ID, function(x) get_dataset(id = x, split_category = split_category))
  return(datasets)
}

# helper
