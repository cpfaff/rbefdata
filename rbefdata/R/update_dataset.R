#' Update a dataset already on BEFdata portal
#'
#' This function updates a dataset from within R. Before you can do so you need to have
#' an account on the portal and set your credentials via the bef_options() function so
#' the authentication works. The function requires an ID of the dataset and either a path
#' to a CSV file or a data frame used to update the old dataset.
#'
#' Please be careful as this function overrides the old dataset (raw data) on the portal
#' completely.
#'
#' @param dataset The data you like to use for upload and to update the old dataset. This can
#' 	  be a either a path to a CSV file or a data frame.
#' @param dataset_id The ID of the dataset you like to update. You can get the ID from the URL
#'        of the dataset you like to update.
#' @param warn Is a warning that should prevent overriding dataset accidentially. Set this to
#'   	  FALSE if you know what you do.
#' @param curl You can pass in a curl handle to reduce memory footprint and to add own options
#' @param open_browser If this is set to true the page of the dataset is opened in the
#'        browser after successful upload. This defaults to FALSE.
#' @return Returns a status message whether the update was successful or not.
#' @examples
#' \dontrun{
#' dataset <- data.frame(a = c(1, 2, 3, 4), b = c("a", "b", "c", "d"))
#' update_dataset(dataset = dataset, dataset_id = 72)
#' }
#' @import RCurl
#' @export update_dataset 

update_dataset <- function(dataset, dataset_id, warn = TRUE, open_browser = F, curl = getCurlHandle()) {
  if (warn) {
    stop("This function overrides the dataset on the portal! If you are sure set the function option warn = FALSE")
  }
  postForm(paste0(bef_options("url"), dataset_id, "/update_workbook"),
    user_credentials = bef_options("user_credentials"),
    "datafile[file]" = upload_file(dataset),
    curl = curl
  )
  if (getCurlInfo(curl)$response.code != 302) {
    stop("Your update failed. Check your access rights!")
  } else {
    if (open_browser) {
      bef.goto.dataset_page(id = dataset_id)
    }
    return(paste("Update of dataset with ID:", dataset_id, "successful!"))
  }
}
