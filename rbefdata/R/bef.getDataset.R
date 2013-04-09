#' Fetch primary data in csv format from a BEFdata portal dataset.
#'
#' This function fetches data from of a BEFdata portal dataset. By default it will 
#' fetch the CSV file of a dataset. You need to provide the function with a 
#' dataset id which you can find in the URL of the file on the BEFdata portal
#' and your user credentials. You can find the credentials inside your profile 
#' on the BEFdata portal. The credentials ensure you have the rights to download the 
#' data. The function returns a dataset object which you can store into a variable as
#' shown in the examples below. The object also offers additional information by attributes.
#' You can querry the information via the attributes() function as shown in the examples below. 
#'
#' @param dataset_id This is the id of a dataset on a BEFdata portal. 
#' @param user_credentials This are your login credentials.
#' @param full_url This functions as direct download link instead of the id. 
#'        You can find it on the dataset show page.
#' @param curl If using the function in a loop, call getCurlHandle() first and pass 
#'    the returned value in here (avoids unnecessary footprint).
#' @param \dots This are other arguments passed to \code{\link[RCurl]{getURLContent}}
#' 
#' @return The function returns a dataframe. An error is thrown when dataset is not found 
#'         or you don't have the proper access right for it.
#' 
#' @examples \dontrun{
#'  datset1 = bef.getDataset(dataset_id=8, user_credentials="Yy2APsD87JiDbF9YBnU")
#'  attributes(datset1)
#'  dataset2 = bef.getDataset(full_url = 'http://befdatadevelepment.biow.uni-leipzig.de/datasets/5/download.csv?seperate_category_columns=true&user_credentials=Yy2APsD87JiDbF9YBnU')
#'  attributes(dataset2)$author
#'  }
#' @import RCurl
#' @export 

bef.getDataset <- function(dataset_id, user_credentials, full_url, curl=getCurlHandle(), ...) {
  if (missing(full_url)) { 
    
    eml_metadata = bef.getMetadata(dataset_id=dataset_id)
       
    if (missing(user_credentials)) 
      full_url = sprintf("%s/datasets/%d/download.csv?seperate_category_columns=true", 
                         bef.options('url'), dataset_id)
    else
      full_url = sprintf("%s/datasets/%d/download.csv?seperate_category_columns=true&user_credentials=%s", 
                         bef.options('url'), dataset_id, user_credentials)
       
  } else {
    
    split_full_url = unlist(strsplit(full_url, split="/"))
    get_datasets_index = grep("datasets", unlist(split_full_url))
    eml_metadata = bef.getMetadata(dataset_id=as.numeric(split_full_url[get_datasets_index+1]))
      
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
