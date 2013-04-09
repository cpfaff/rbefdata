#' Fetch primary data in csv format from a BEFdata portal paperproposal
#'
#' This function fetches data from of a BEFdata portal paperproposal. By default it will 
#' fetch all associated CSV files of a paperproposal next to the informations available 
#' like the title, urls and the id of the datasets. You need to provide the function with a 
#' proposal id which you can find in the URL of the proposal on the BEFdata portal
#' and your user credentials. You can find the credentials inside your profile 
#' on the BEFdata portal. The credentials ensure you have the rights to download the 
#' data. The function returns a list object which you can store into a variable as
#' shown in the examples below. 
#'
#' @param proposal_id This is the id of a paper proposal. You can download all datasets in 
#'        one turn given the proposal_id and your user credentials.
#' @param user_credentials your login credentials
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'    the returned value in here (avoids unnecessary footprint)
#' @param \dots other arguments passed to \code{\link[RCurl]{getURLContent}}
#' 
#' @return a list. Error is thrown when proposal is not found or you don't have the proper access right for it.
#' 
#' @examples \dontrun{
#'  prop1 = bef.getproposal(proposal_id=8, user_credentials="Yy2APsD87JiDbF9YBnU")
#'  prop1 
#'  }
#' @import RCurl
#' @export 

bef.getProposal <- function(proposal_id, user_credentials, full_url, curl=getCurlHandle(), ...) {
  if (missing(full_url)) { 
    full_proposal_url = sprintf("%s/paperproposals/%d.csv?user_credentials=%s", 
                                bef.options('url'), proposal_id, user_credentials) 
  } else {  
    if(grepl(full_url, pattern="*.csv*")) {
      full_proposal_url = full_url
    } else 
      full_proposal_url = paste(full_url, ".csv", sep="")    
  }

  proposal_raw_csv = getURLContent(full_proposal_url, curl = curl, ...)  
  
  if(grepl(proposal_raw_csv, pattern = "^\\s*<html")) stop("Proposal not found or not accessible. Please check your credentials and make sure you have access right for it.")
  con = textConnection(proposal_raw_csv)
  on.exit(close(con))
  proposal_csv = read.csv(con) 
  
  lst = list()
  for(i in 1:nrow(proposal_csv)){
    lst$dataset_id[i] = toString(proposal_csv[i, "ID"])  
    lst$dataset_title[i] = toString(proposal_csv[i,"Title"])
    lst$dataset_url[i] = toString(proposal_csv[i,"Dataset.Url"])
    lst$dataset_csv_url[i] = toString(proposal_csv[i,"CSV.download"]) 
    lst$dataset_csv[i] = list(bef.getdata(full_url=toString(proposal_csv[i,"CSV.download"])))
  }
  
  return(lst)    
  
}
