#' Upload a dataset to the BEFdata portal
#'
#' This function uploads a dataset from within R to a BEFdata portal set in
#' your options. Before you can do so you need to have an account on the portal
#' and set your credentials via the bef.options() function so the authentication works.
#' The function requires a title for the dataset and either a path to a CSV file for
#' for upload or a dataset object. The dataset must have unique column names.
#'
#' @param dataset_title The title of the dataset.
#' @param dataset_object The data frame you like to upload as dataset.
#' @param file_path The path to a CSV file for upload as dataset.
#' @param curl You can pass in a curl handle with additional options.
#'
#' @return Returns a status message with the ID of the dataset (not yet).
#' @import RCurl
#' @export

bef.portal.upload.dataset <- bef.upload.dataset <- function(dataset_title, dataset_object, file_path, curl = getCurlHandle()) {
  if (missing(file_path)) {
    write.csv(dataset_object, paste0(tempdir(), "/", "upload_preparation.csv"), row.names=FALSE)
    upload_file = fileUpload(paste0(tempdir(), "/", "upload_preparation.csv"))
  } else {
    upload_file = fileUpload(file_path)
  }
  upload_url = upload_url()
  postForm(upload_url, title = dataset_title,  "datafile[file]" = upload_file, curl = curl)
  return("Your data has been uploaded successfully")
}
