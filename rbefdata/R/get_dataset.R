#' Fetch datasets from a BEFdata portal
#'
#' This function helps you import datasets from a BEFdata portal instance. You
#' need to provide the function with the database ID of the dataset you want do
#' download. You can find the ID in the URL of the dataset on the BEFdata
#' portal. As the import of data requires checking your permissions to access
#' the data you need to set your user_credentials in the rbefdata options with
#' bef_options("user_credentials" = "<yourcredentials>". You can find your
#' credentials in the profile page on the BEFdata portal. 
#'
#' The function returns a data frame or a list of dataframes in case you
#' provided multiple IDs. Durgin the import each data frame is associated with
#' its metadata. You can query the information via the attributes() function
#' which is also shown in the examples below. 
#'
#' @param id Contains the ids of the datasets you want to import.
#'
#' @param split_category Determines whether columns with mixed data types are split 
#'        into separate columns. This is handeled from the BEF-Data portal side and
#'        is set to true by default.
#'
#' @return The function returns a data frame or a list of data frames
#'         containing the data. An error is thrown when the dataset is not found or if
#'         you don't have the rights to access it.
#'
#' @examples
#' \dontrun{
#' # get one dataset
#' data <- rbefdata::get_dataset(id = 8)
#' # show metadata
#' meta_data <- attributes(data)
#' # get multiple datasets
#' data <- rbefdata::get_dataset(id = c(7,8))
#' }
#'
#' @import RCurl 
#' @importFrom tibble as_tibble
#' @export get_dataset

# public ui

get_dataset <- function(id, split_category = T){
  # get a curl handle. useful for loop processing as it reduces memory usage
  curl = getCurlHandle()

  if(length(id) > 1){
    lapply(id, function(index){private_get_dataset(id = index, curl = curl, split_category = split_category)})
  } else {
    private_get_dataset(id = id, curl = curl, split_category = split_category)
  }
}

# private 

private_get_dataset <- function(id, curl = getCurlHandle(), split_category = T) {
  # create dataset url
  dataset_url <- dataset_url(id, user_credentials = bef_options("user_credentials"), type = "csv2", split_category = split_category)

  # get the content provided on that url
  response_body <- getURL(dataset_url, curl = curl)

  # check the response code
  if (getCurlInfo(curl)$response.code != 200) {
    stop("Your dataset was not found. Please check the ID")
  }

  # read the csv dataset  
  dataset <- read.csv(text = response_body)

  # get the corresponding metadata
  metadata <- get_metadata(id, split_category = split_category)

  # set the metadata as attributes on the data
  attributes(dataset) <- c(attributes(dataset), metadata)

  # check where we have categories and where numerics 
  categories <- (attributes(dataset)$columns)$numericDomain
  factor_treatment <- which(is.na(categories))
  numeric_treatment <- which(!is.na(categories))

  # make sure that this applies to the dataset
  if (is.data.frame(dataset[, numeric_treatment])) {
    dataset[, numeric_treatment] <- as.data.frame(lapply((dataset[, numeric_treatment]), as.numeric))
  } else {
    dataset[, numeric_treatment] <- as.numeric(dataset[, numeric_treatment])
  }

  if (is.data.frame(dataset[, factor_treatment])) {
    dataset[, factor_treatment] <- as.data.frame(lapply((dataset[, factor_treatment]), as.factor))
  } else {
    dataset[, factor_treatment] <- as.numeric(dataset[, factor_treatment])
  }

  return(as_tibble(dataset))
}
