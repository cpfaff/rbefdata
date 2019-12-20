#' Get all categories of a datagroup 
#'
#' This function help you get a all categories in a datagroup. This information
#' can also be used to harmonize your database. This can be done using the last
#' column in the dataframe providing IDS mentioned in the first column of the
#' datafram. After you have relinked the categories you can upload the data
#' frame using the categories upload command. The BEFdata portal will pick up
#' the changes and harmonize the category. 
#'
#' @param id The ID of the data group you like to get the categories from.
#'
#' @return Returns a data frame with the categories for the datagroup or a 
#'         list of data frames in case you request multiple categories.
#'
#' @examples
#' \dontrun{
#'  get_datagroup_category(id = 22)
#' }
#'
#' @import RCurl
#' @importFrom tibble as_tibble enframe
#' @export get_datagroup_category

# public ui

get_datagroup_category <- function(id){
  datagroup_status = datagroup_exists(id)
  existing_group = id[which(datagroup_status)]
  non_existing_group = id[which(!datagroup_status)]
  curl_handle = getCurlHandle()
  if(length(existing_group) == 0){
    stop(paste0("The following requested datagroups do not exist. Check the IDs:", paste0(non_existing_group, collapse = ",")))
  }
  if(length(existing_group) < length(id)){
    stop(paste0("The following requested datagroups do not exist. Check the IDs:", paste0(non_existing_group, collapse = ",")))
  }
  if(length(existing_group) > 1){
    lapply(existing_group, function(index){private_get_datagroup_category(id = index, curl = curl_handle)})
  } else {
    private_get_datagroup_category(id = existing_group, curl = curl_handle)
  }

}

# private

private_get_datagroup_category <- function(id, curl = getCurlHandle()) {
  # get the url of the datagroup
  datagroup_url <- datagroups_url(datagroups_id = id, type = "download")
  # request the url content
  response_body <- getURL(datagroup_url, curl = curl)
  # create a dataframe ensure that the merge id is numeric
  dataframe <- transform(read.csv(text = response_body), MERGE.ID = as.integer(MERGE.ID))
  # return everything as tibble
  return(as_tibble(dataframe))
}

# helper

# check if given datagroups exist on a portal
datagroup_exists <- function(id){
  # minimize memory footprint
  curl_handle = getCurlHandle()
  # iterate over the given ids and return logical status vector
  sapply(id, function(one_id){ 
           datagroup_url <- datagroups_url(datagroups_id = one_id, type = "show")  
           getURL(datagroup_url, curl = curl_handle)
           if(getCurlInfo(curl_handle)$response.code != 200) {
             FALSE
           } else {
             TRUE
           }
  }) 
}
