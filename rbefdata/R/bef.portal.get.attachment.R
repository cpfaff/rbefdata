#' Download attachment files of a dataset in BEFdata portal
#'
#' This function will download attachment files associated with a dataset into specified directory.
#'
#' @return a data frame of filenames and file descriptions are returned invisibly.
#'
#' @param dataset_id the id of dataset
#' @param user_credentials your login credentials
#' @param dir the directory to store attachment files. default to the current working directory.
#' @param curl If using in a loop, call getCurlHandle() first and pass the returned value
#'         in here (avoids unnecessary footprint).
#' @param \dots  arguments passed to \code{\link[RCurl]{getURLContent}}.
#' @param verbose boolean flag whether to display details about downloading. default to FALSE.
#'         Note: this is a experimental feature.
#' @export

bef.portal.get.attachment <- function(dataset_id, user_credentials=bef.options('user_credentials'), dir=getwd(), curl=getCurlHandle(), ..., verbose=FALSE) {
  url = dataset_url(dataset_id, "freeformat", user_credentials=user_credentials)
  freeformats_csv = getURLContent(url, curl=curl, ...)
  if (getCurlInfo(curl)$response.code != 200) {
    stop("Dataset not found or not accessible. Please check your credentials and make sure you have access to it")
  }
  files = read.csv(text = freeformats_csv, stringsAsFactors=F)

  if (nrow(files)) {
    if (!file.exists(dir)) dir.create(dir)
    for (i in seq_len(nrow(files))) {
      filename = suggest_filename(files$Filename[i], dir)
      f = CFILE(file.path(dir, filename), mode="wb")
      if (verbose) cat("      ", sprintf("Saving %s => %s", sQuote(files$Filename[i]), sQuote(file.path(dir, filename))))
      curlPerform(url = files$URL[i], writedata = f@ref,
          progressfunction = function(down, up) {
            if (down["downloadTotal"]) {
              cat("\r", sprintf("[%3.0f%%]", 100*down["downloadNow"]/down["downloadTotal"]), sep="")
            }
          }, noprogress = !verbose)
      close(f)
      if (verbose) cat("\n")
    }
  } else {
    warning(paste("No attachement files for dataset:", dataset_id))
  }
  invisible(files[c("Filename", "Description")])
}
