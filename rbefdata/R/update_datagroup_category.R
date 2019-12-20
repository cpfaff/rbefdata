#' Upload a category set
#'
#' This function changes the categories of a datagroup
#' on a BEFdata portal. It expects categories in the exact
#' same format as they are downloaded using the
#' "bef.portal.get.categories_for" command. These are five
#' columns specifying the category id, the short, long, and
#' description field of the category, as well as a "merge id"
#' column. The latter is used if a category should be merged
#' with another one. The category given in teh "merge id"
#' column will stay on the portal.
#'
#' @param datagroup_id Categories ID you like to harmonize. You can find this in the URL of
#' the category.
#' @param categories Either a data frame with the categories or a csv containing the categories
#' and merge ID and stuff downloaded from the portal.
#' @param curl Pass in a curl handle with own options or to reduce memory footprint.
#' @return Returns a status message whether the upload was successful or not.
#' @examples
#' \dontrun{
#' dataframe <- bef.portal.get.categories_for(datagroup_id = 22)
#' bef.portal.upload.categories(datagroup_id = 22, categories = dataframe)
#' }
#' @import RCurl
#' @export bef.portal.upload.categories bef.upload.categories
#' @aliases bef.upload.categories
#' @seealso \code{bef.portal.get.categories_for}

bef.portal.upload.categories <- bef.upload.categories <- function(datagroup_id, categories, curl = getCurlHandle()) {
  # TODO: This is not working and might needs user credentials of course
  postForm(datagroups_url(datagroups_id = datagroup_id, type = "upload"),
    "csvfile[file]" = upload_file(categories),
    .opts = curlOptions(
      referer = bef_options("url"),
      useragent = "rbefdata"
    ),
    curl = curl
  )
  if (getCurlInfo(curl)$response.code != 302) {
    stop("Your category upload failed. Check your access rights!")
  } else {
    return(paste("Your Category upload was successful!"))
  }
}
