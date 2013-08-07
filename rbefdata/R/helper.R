# a helper method which behaves like dataset_url in Rails
dataset_url <- function(id, type = c("csv2", "csv", "xls", "eml", "freeformat"), ...) {
  type = match.arg(type, c("csv2", "csv", "xls", "eml", "freeformat"))
  seg = switch(type, csv2="/download.csv", csv="/download.csv", xls="/download", eml=".eml", freeformat="/freeformats_csv" )
  params = Filter(Negate(is.null), list(...))
  if (type == "csv2") params$separate_category_columns = TRUE
  if (type == "eml") params$separate_category_columns = TRUE
  query_string = ""
  if (length(params)) query_string = paste("?", paste(names(params), params, sep = "=", collapse = "&"), sep = "")
  url = sprintf("%s/datasets/%d%s%s", bef.options("url"), id, seg, query_string)
  url = gsub("\\s", "", url)
  return(url)
}

# function that checks if authentication is given
this_function_requires_api_authentication <- function() {
  user_credentials = bef.options("user_credentials")
  if (is.null(user_credentials) || is.na(user_credentials) || user_credentials == '') {
    stop("This function requires an API key for authentication. Please set your key via bef.options('user_credentials'=yourkey)!")
  }
}

# returns the upload url with user credentials
upload_url <- function() {
  base_url = bef.options("url")
  segment = "/datasets/create_with_datafile"
  parameter_sep = "?"
  url = paste0(base_url, segment, parameter_sep, 'user_credentials=', bef.options('user_credentials'))
  return(url)
}

# returns an upload file no matter if it is given as path to a file or data.frame
upload_file <- function(dataset) {
  if (is.data.frame(dataset)) {
    write.csv(dataset, file.path(tempdir(), "upload_dataset.csv"), row.names = FALSE, fileEncoding = "UTF-8", quote = FALSE)
    upload_file = fileUpload(file.path(tempdir(), "upload_dataset.csv"))
  } else {
    upload_file = fileUpload(dataset)
  }
  return(upload_file)
}

# a helper that returns the keyword url provided the id
keyword_url <- function(id) {
  url = sprintf("%s/keywords/%d", bef.options("url"), id)
  return(url)
}

# go to the dataset page of the file you just uploaded
bef.goto.dataset_page <- function(id) {
  base_url = bef.options("url")
  segment = "/datasets/"
  id = id
  browseURL(paste0(base_url, segment, id))
}

bef.relate_a <- function(thing) {
  upper = bef.tematres.search.broader_keywords(thing)
  lower = bef.tematres.search.narrower_keywords(thing)
  list(upper_terms = upper, lower_terms = lower)
}


# Helper that determines internet connection
is_internet_connected <- function() {
  if (.Platform$OS.type == "windows") {
    ipmessage <- system("ipconfig", intern = TRUE)
  } else {
    ipmessage <- system("ifconfig", intern = TRUE)
  }
  validIP <- "((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)[.]){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
  if(!any(grep(validIP, ipmessage[-grep("127.0.0.1", ipmessage)]))) {
    warning("Sorry not internet connection. Please connect first!")
  }
}

# A helper helper that capitalizes the first letter of a string
capitalize <- function(string) {
 first_letter = substr(string, start=0, stop=1)
 rest_of_the_string = substr(string, start=2, stop=nchar(string))
 paste0(toupper(first_letter), rest_of_the_string)
}

# Check the portal if a dataset title has been taken or not
the_title_is_taken <- function(dataset_title) {
	datasets_info_xml = xmlTreeParse(paste0(bef.options("url"), "/datasets.xml"), useInternal = T)
	datasets_info_titles = xpathSApply(datasets_info_xml, "//title", xmlValue)
	datasets_info_titles = tolower(datasets_info_titles)
	dataset_title_status = any(datasets_info_titles == tolower(dataset_title))
	return(dataset_title_status)
}

# a helper that returns the metadata attached to a dataset object
bef.display.metadata <- bef.metadata <- function(dataset) {
  return(attributes(dataset))
}

# querry a media wiki (later semantic media wiki to get definitions of a term)
bef.define_a <- function(term, wiki_api_url="http://en.wikipedia.org/w/api.php") {
	search_return <- getForm(
	  wiki_api_url,
	  action  = "opensearch",
	  search  = term,
	  format  = "xml",
	  .opts   = ""
	)
	document = xmlTreeParse(search_return, useInternal=TRUE)
	document_root = xmlRoot(document)
	nodeset = getNodeSet(document_root, "//*[local-name() = 'Description']")
	description_list = (lapply(nodeset, function(x) xmlSApply(x, xmlValue)))
	cleaned_descriptions = lapply(description_list, function(x) gsub("\"", "'", x))
	descriptions = do.call(rbind, cleaned_descriptions)
	return(descriptions)
}


# a helper method which behaves like paperproposal_url in Rails
paperproposal_url <- function(proposal_id, ...) {
  params = Filter(Negate(is.null), list(...))
  query_string = ""
  if (length(params)) query_string = paste("?", paste(names(params), params, sep = "=", collapse = "&"), sep = "")
  url = sprintf("%s/paperproposals/%d.csv%s", bef.options('url'), proposal_id, query_string)
  url = gsub("\\s", "", url)
  return(url)
}

# TODO this will tell the id to a given title if the user has uploaded his file successfully
# title_to_id <- function(title)
# datastes_info_df$
# datasets_info_ids = xpathSApply(datasets_info_xml, "//id", xmlValue)
# datastes_info_df = data.frame(datasets_info_ids, datasets_info_titles)



# a helper function to extract id from a dataset or paperproposal url
url_to_id <- function(url, resource="datasets") {
  pattern = sprintf(".*/%s/(\\d+).*", resource)
  as.numeric(ifelse(grepl(pattern, url), sub(pattern, "\\1", url), NA))
}

# a wrapper function of xpathSApply. which will return NA instead of zero-lenght list when nodes not found
xmlNodesValue <- function(doc, path){
  out = xpathSApply(doc, path, xmlValue, trim=T, ignoreComments=T)
  out = Filter(function(x) x!="", out)
  if (length(out) == 0) return(NA)
  out
}

# for existing file, append a number to its filename
suggest_filename <- function(filename, dir=getwd()) {
  suggested_filename = filename
  i = 0
  while (file.exists(file.path(dir, suggested_filename))) {
    i = i + 1
    suggested_filename = sub(filename, pattern="(\\.\\w+)?$", replacement=sprintf("(%d)\\1", i))
  }
  return(suggested_filename)
}
