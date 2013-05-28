#' This is a wrapper for the getter functions of the BEFdata R package.
#'
#' It returns contents depending on the on the parameters you provide to the function.
#' It will fetch a dataset if you provide the id. If you provide a proposal id it will
#' fetch all datasets associated with that proposal. You can even provide the function with
#' a full URL of either of them and it will fetch the right contents by parsing the URL.
#'
#' @param dataset_id This is the id of a dataset on a BEFdata portal. You find the id
#'        in the url of the dataset or on the download page of the dataset.
#' @param proposal_id This is the id of a paperproposal
#' @param user_credentials This are the login credentials required to verify
#'        the user identity. They ensure, you have the rights to download the data.
#' @param full_url This option works as direct download link. It can be used instead of
#'        the according ids. You can find the URL either on the dataset download page for
#'        a dataset or on the proposal page for a paper proposal.
#'
#' @param keywords The can be false or true. If it is defined as true the wrapper will get all
#'        keywords associated with the BEFdata portal.
#'
#' @return The function returns a dataframe in case of a single dataset and a list of objects in case
#'         of a paper proposal as well as for multiple datasets defined via ids. An error is thrown when
#'         the dataset or proposal is not found or you don't have the proper access right to perform
#'         the action. For detailed informations about the used functions see \code{\link{bef.portal.get.dataset}} and
#'         \code{\link{bef.portal.get.proposal}}.
#'
#' @examples \dontrun{
#'  dataset = bef.portal.get(dataset_id=8, user_credentials="Yy2APsD87JiDbF9YBnU")
#'  proposal = bef.portal.get(proposal_id=7, user_credentials="Yy2APsD87JiDbF9YBnU")
#'  dataset_full_url = bef.portal.get(full_url = 'http://befdatadevelepment.biow.uni-leipzig.de/datasets/5/download.csv?seperate_category_columns=true&user_credentials=Yy2APsD87JiDbF9YBnU')
#'  multiple = bef.portal.get(dataset_id=c(7,8), user_credentials="Yy2APsD87JiDbF9YBnU")
#'  }
#' @import RCurl
#' @export

bef.portal.get <- function(dataset_id, proposal_id, full_url, user_credentials=bef.options('user_credentials'), keywords=FALSE, attachments=FALSE, dir=bef.options('download_dir')) {
  if (!missing(full_url)) {
    # check which content to fetch
    if (grepl(full_url, pattern = "*/datasets/*")) {
        dataset = bef.portal.get.dataset(full_url=full_url)
        return(dataset)
    }
    if (grepl(full_url, pattern="*/paperproposals/*")) {
        proposal = bef.portal.get.proposal(full_url=full_url)
        return(proposal)
    }
  }

  if (dataset_id && attachments) {
    bef.portal.get.attachment(dataset_id, user_credentials=user_credentials, dir=dir)
    return()
  }

  # fetch via dataset_id
  if (!missing(dataset_id)) {
      dataset = bef.portal.get.dataset(dataset_id=dataset_id, user_credentials=user_credentials)
      return(dataset)
  }

  # fetch via proposal_id
  if (!missing(proposal_id)) {
      proposal = bef.portal.get.proposal(proposal_id=proposal_id, user_credentials=user_credentials)
      return(proposal)
  }

  # get all the keywords
  if (keywords) {
    keywords=bef.portal.get.keywords()
    return(keywords)
  }

}
