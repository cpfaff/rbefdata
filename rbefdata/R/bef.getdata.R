#' This is a wrapper for the getter functions of the befdata R package. 
#'
#' It returns contens depending on the on the parameters you provide to the function. 
#' It will fetch a dataset if you provide the id. If you provide a proposal id it will 
#' fetch all datasets associated with that proposal. You can even provide the function with 
#' a full url and it will fetch the right contents by parsing the url. 
#'
#' @param dataset_id This is the id of a dataset on a BEFdata portal. You find the id 
#'        in the url of the dataset or on the download page of the dataset. 
#' @param user_credentials This are the login credentials required to verify 
#'        the user identity. They ensure, you have the proper rights to download the data.
#' @param full_url This option works as direct download link. It can be used instead of 
#'        the according ids. You can find the url either on the dataset download page for 
#'        a dataset or on the proposal page for a paper proposal.
#' 
#' @return It returns a dataframe in case of a single dataset and a list of objects in case 
#'         of a paper proposal. An error is thrown when the dataset or proposal is not found 
#'         or you don't have the proper access right to perform the action. For detailed 
#'         informations about the the used functions see bef.getData() and bef.getProposal().
#' 
#' @examples \dontrun{
#'  dataset = bef.getdata(dataset_id=8, user_credentials="Yy2APsD87JiDbF9YBnU")
#'  proposal = bef.getdata(proposal_id=7, user_credentials="Yy2APsD87JiDbF9YBnU")
#'  dataset_full_url = bef.getdata(full_url = 'http://befdatadevelepment.biow.uni-leipzig.de/datasets/5/download.csv?seperate_category_columns=true&user_credentials=Yy2APsD87JiDbF9YBnU')
#'  }
#' @import RCurl
#' @export 

bef.getdata <- function(dataset_id, proposal_id, full_url, user_credentials) {
  if (!missing(full_url)) {
    # check which content to fetch
    if(grepl(full_url, pattern = "datasets")) 
      {     
        dataset=bef.getDataset(full_url=full_url)  
        return(dataset)
      } 
    if(grepl(full_url, pattern="paperproposals"))
      {
        proposal=bef.getProposal(full_url=full_url)   
        return(proposal)
      }  
  }
  
  # fetch via dataset_id
  if (!missing(dataset_id)) 
    {  
      dataset=bef.getDataset(dataset_id=dataset_id, user_credentials=user_credentials)
      return(dataset)
    }
  # fetch via proposal_id
  if (!missing(proposal_id)) 
    {  
      proposal=bef.getProposal(proposal_id=proposal_id, user_credentials=user_credentials)
      return(proposal)
    } 
}
