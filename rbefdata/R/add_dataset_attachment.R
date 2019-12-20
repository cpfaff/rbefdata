#' Attach any file or data to a dataset
#'
#' This function attaches a freeformat file to a dataset.
#'
#' @param id The ID of the dataset you like to attach to. You can get the ID from the URL
#'        of the dataset.
#' @param attachment Can be either a path to a file or an R data frame.
#' @param description An optional description to your attachmed freeformat file.
#' @param curl You can pass in a curl handle to reduce memory footprint and to add own options
#' @param open_browser If this is set to true the page of the dataset is opened in the
#'        browser after successful upload. This defaults to FALSE.
#' @return Returns a status message whether the update was successful or not.
#' @examples
#' \dontrun{
#' rbefdata::add_dataset_attachment(id = 72, attachment = dataset, description = "This
#' is a test description for a new file", open_browser = T)
#' }
#' @import RCurl
#' @export add_dataset_attachment 

add_dataset_attachment <- function(id, attachment, description = "", open_browser = FALSE, curl = getCurlHandle()) {
  postForm(paste0(bef_options("url"), "/files/freeformats"),
    freeformattable_id = id,
    freeformattable_type = "Dataset",
    user_credentials = bef_options("user_credentials"),
    "freeformat[file]" = upload_file(attachment),
    "freeformat[description]" = description,
    .opts = curlOptions(
      referer = bef_options("url"),
      useragent = "rbefdata"
    ),
    curl = curl
  )
  if (getCurlInfo(curl)$response.code != 302) {
    stop("Your attachment failed. Check your access rights!")
  } else {
    if (open_browser) {
      bef.goto.dataset_page(id = id)
    }
    return(paste("Attachment to dataset with ID:", id, "successful!"))
  }
}
