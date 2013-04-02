#' Fetch primary data in csv format from a BEFdata portal
#'
#' This function fetches data from a dataset of a BEFdata portal. By default it will 
#' fetch the CSV file of a dataset. You need to provide the function with a 
#' dataset id which you can find in the URL of the file on the BEFdata portal
#' and your user credentials to ensure you have the rights to download the 
#' data. You can find your user credentials in your user profile of the BEFdata portal. 
#' You can save the data into a variable like in the example below. The function returns 
#' a dataset object which has additional information you can querry via the attributes 
#' function. So you can get the authors and descriptions as shown in the example below. 
#'
#' @param dataset_id id of a dataset in a BEFdata portal. 
#' @param user_credential your login credential
#' @param full_url use as direct download link instead the id. you can find it 
#'   in the dataset show page.
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'    the returned value in here (avoids unnecessary footprint)
#' @param \dots other arguments passed to \code{\link[RCurl]{getURLContent}}
#' 
#' @return a dataframe. Error is thrown when dataset is not found or you don't have the proper access right for it.
#' 
#' @examples \dontrun{
#'  dat1 = bef.getdata(dataset_id=8, user_credential="Yy2APsD87JiDbF9YBnU")
#'  attributes(dat1)
#'  dat2 = bef.getdata(full_url = 'http://befdatadevelepment.biow.uni-leipzig.de/datasets/5/download.csv?seperate_category_columns=true&user_credentials=Yy2APsD87JiDbF9YBnU')
#'  attributes(dat2)$authors
#'  }
#' @import RCurl
#' @export 

bef.getdata <- function(dataset_id, user_credential, full_url, curl=getCurlHandle(), ...) {
  if (missing(full_url)) { 
    
    eml_metadata = bef.getMetaData(dataset_id=dataset_id)
       
    if (missing(user_credential)) 
      full_url = sprintf("%s/datasets/%d/download.csv?seperate_category_columns=true", 
                         bef.options('url'), dataset_id)
    else
      full_url = sprintf("%s/datasets/%d/download.csv?seperate_category_columns=true&user_credentials=%s", 
                         bef.options('url'), dataset_id, user_credential)
       
  } else {
    
    split_full_url = strsplit(full_url, split="/")
    get_datasets_index = grep("datasets", unlist(split_full_url[1]))
    eml_metadata = bef.getMetaData(dataset_id=as.numeric(split_full_url[[1]][get_datasets_index+1]))
      
  }

  csv = getURLContent(full_url, curl = curl, ...) 
  
  if(grepl(csv, pattern = "^\\s*<html")) stop("Dataset not found or not accessible. Please check your credentials and make sure you have access right for it.")
  con = textConnection(csv)
  on.exit(close(con))
  csv = read.csv(con)
  
  attr(csv, "title") = eml_metadata$title
  attr(csv, "authors") = eml_metadata$authors
  attr(csv, "abstract") = eml_metadata$abstract
  attr(csv, "taxonicextent") = eml_metadata$taxonicextent
  attr(csv, "spatial_information") = eml_metadata$spatial
  attr(csv, "temporal_information") = eml_metadata$temporal 
  attr(csv, "sampling") = eml_metadata$temporal 
  attr(csv, "analyze") = eml_metadata$analyze
  return(csv)
}
