#' Attach a freeformat file to a paper proposal
#'
#' This function attaches a freeformat file to a proposal
#'
#' @param id The ID of the proposal you like to attach to. You can get the ID from the URL
#'        of the proposal.
#' @param attachment Can be either a path to a file or an R data frame.
#' @param description An optional description to your attachmed freeformat file.
#' @param curl You can pass in a curl handle to reduce memory footprint and to add own options
#' @param is_paper Just to tell the portal if it is a published paper you are attaching as pdf
#'        for example. This parameter can be TRUE or FALSE and defaults to FALSE.
#' @param doi If the attachment has a persistent digital identifyer you can add it here.
#' @param open_browser If this is set to true the page of the proposal is opened in the
#'        browser after successful upload. This defaults to FALSE.
#' @return Returns a status message whether the update was successful or not.
#' @examples
#' \dontrun{
#' add_proposal_attachment(id = 72, attachment = dataset, description = "This
#' is a test description for the new attachment file", open_browser = T)
#' }
#' @import RCurl
#' @export add_proposal_attachment 

add_proposal_attachment <- function(id, attachment, description = "", is_paper = FALSE, doi = "", open_browser = FALSE, curl = getCurlHandle()) {
  postForm(paste0(bef_options("url"), "/files/freeformats"),
    freeformattable_id = id,
    freeformattable_type = "Paperproposal",
    user_credentials = bef_options("user_credentials"),
    "freeformat[uri]" = doi,
    if (is_paper) {
      "freeformat[is_essential]" <- 1
    } else {
      "freeformat[is_essential]" <- 0
    },
    "freeformat[file]" = upload_file(attachment),
    "freeformat[description]" = description,
    .opts = curlOptions(
      referer = bef_options("url"),
      useragent = "rbefdata"
    ),
    curl = curl
  )

  if (getCurlInfo(curl)$response.code != 302) {
    stop("Your Attachment failed. Check your access rights!")
  } else {
    if (open_browser) {
      bef.goto.proposal_page(id = id)
    }
    return(paste("Attachment to proposal with ID:", id, "successful!"))
  }
}

