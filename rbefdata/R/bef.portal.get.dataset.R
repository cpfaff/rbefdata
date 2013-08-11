#' Fetch primary data in CSV format from a BEFdata portal dataset.
#'
#' This function fetches data associated with a BEFdata portal dataset. By
#' default it will fetch the CSV file of a dataset. You need to provide the
#' function with a dataset id which you can find in the URL of the dataset on
#' the BEFdata portal. As this usually requires authentication you need to set
#' your credentials in the options (bef.options("user_credentials" = "asdfpoj").
#' You can find the credentials inside of your profile page on the BEFdata portal.
#' The credentials ensure you have the rights to download the data.
#'
#' The function returns a dataset object which you can store in a variable as
#' shown in the examples below. The object also offers additional information
#' by attributes. You can query the information via the attributes() function
#' which is also shown in the examples. If you like to fetch multiple datasets
#' you can use the apply functions provided by R see example belwo.
#'
#' @param id This is the id of a dataset on a BEFdata portal. Works also
#'        multiple datasets. In this case you provide the ids with c(1,2,3)
#' @param curl If the function is used inside a loop, call getCurlHandle() first
#'        and pass in the returned value here. This avoids an unnecessary footprint.
#' @param \dots This are other arguments passed to \code{\link[RCurl]{getURLContent}}
#'
#' @return The function returns a dataframe for each dataset. An error is thrown when the dataset is
#'         not found or if you don't have the rights to access it.
#'
#' @examples \dontrun{
#'         datset1 = bef.portal.get.dataset(id=8)
#'         metadata1 = attributes(dataset1)
#'
#'         curl = getCurlHandle()
#'         ids = c(8,70)
#'         dataset_list = lapply(ids, function(x) bef.portal.get.dataset(id = x, curl = curl))
#'         metadata = attributes(dataset_list[[1]])
#'       }
#' @import RCurl
#' @export

bef.portal.get.dataset <- function(id, curl=getCurlHandle(), ...) {
  full_url = dataset_url(id, user_credentials= bef.options("user_credentials"))
  response_body = getURLContent(full_url, curl = curl)
  if(getCurlInfo(curl)$response.code != 200) {
    msg = sprintf("Dataset(id=%d) not found or not accessible. Please check your credentials and make sure you have access right for it.", id)
    stop(msg)
  }
  dataset = read.csv(text = response_body)
  metadata = bef.portal.get.metadata(id)
  attributes(dataset) = c(attributes(dataset), metadata)
  return(dataset)
}
