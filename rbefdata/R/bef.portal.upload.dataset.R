#' Upload a dataset to the BEFdata portal
#'
#' This function uploads a dataset from within R to a BEFdata portal set in
#' your options. Before you can do so you need to have an account on the portal
#' and set your credentials via the bef.options() function so the authentication works.
#' The function requires a title for the dataset and either a path to a CSV file for
#' for upload or a dataset object. The dataset must have unique column names.
#'
#' @param title The title of the dataset.
#' @param dataset The data you like to upload as dataset. This can be a path to a CSV file
#'        or a data frame.
#' @param curl You can pass in a curl handle with additional options.
#' @return Returns a status message with the ID of the dataset (not yet).
#' @import RCurl
#' @export

bef.portal.upload.dataset <- bef.upload.dataset <- function(title, dataset, curl = getCurlHandle()) {
  postForm(upload_url(), title = title,  "datafile[file]" = upload_file(dataset), curl = curl)
  return("Your data has been uploaded successfully")
}
