#' Download files attached to datasets on a BEFdata portal
#'
#' This function helps you download files which are attached to a dataset on a
#' BEFdata instance. It downloads to a default directory in the current working
#' directory (downloads). This can be changed setting using the options command
#' of rBEFdata. If the file exists the function will choose another name with
#' an increasing number.
#'
#' @param dataset The ID of dataset you like to fetch the attachments from. You
#'        find the ID on the dataset page on the BEFdata portal.
#' @param directory The directory to store attachment files to. By default it
#'        creates a folder called "downloads" under the current working directory. The
#'        default can be changed by bef.options.
#' @return A data frame of file information is returned invisibly. NULL is returned when
#'         the dataset has no attachement files.
#' @export get_dataset_attachment

# public ui
get_dataset_attachment <- function(id, directory = bef.options("download_dir"), curl = getCurlHandle()){
  if(length(id) > 1){
    invisible(lapply(id, function(index){private_get_dataset_attachment(id = index, directory = directory, curl = curl)}))
  } else {
    private_get_dataset_attachment(id = id, directory = directory, curl = curl)
  }
}

# private

private_get_dataset_attachment <- function(id, directory = bef.options("download_dir"), curl = getCurlHandle()) {
  dataset_url <- dataset_url(id, "freeformat", user_credentials = bef.options("user_credentials"))
  freeformats_csv <- getURLContent(dataset_url, curl = curl)
  if (getCurlInfo(curl)$response.code != 200) {
    stop("Dataset not found or not accessible. Please check your credentials and make sure you have access to it")
  }
  files <- read.csv(text = freeformats_csv, stringsAsFactors = F)
  if (nrow(files)) {
    if (!file.exists(directory)) dir.create(directory)
    files$path <- file.path(directory, sapply(files$Filename, suggest_filename, dir = directory, USE.NAMES = T))
    for (i in seq_len(nrow(files))) {
      f <- CFILE(files$path[i], mode = "wb")
      cat(sprintf("Saving %s => %s\n", sQuote(files$Filename[i]), sQuote(files$path[i])))
      flush.console()
      curlPerform(url = files$URL[i], writedata = f@ref)
      close(f)
    }
    invisible(files)
  } else {
    warning(paste("No attachement files for dataset:", id))
    invisible(NULL)
  }
}
