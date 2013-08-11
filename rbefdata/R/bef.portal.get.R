#' This is a wrapper for the getter functions of the BEFdata R package.
#'
#' It returns contents depending on the on the parameters you provide to the function.
#' It will fetch a dataset if you provide the id. If you provide a proposal id it will
#' fetch all datasets associated with that proposal. You can even provide the function with
#' a full URL of either of them and it will fetch the right contents by parsing the URL.
#'
#' @param dataset_id This is the id of a dataset on a BEFdata portal. You find the id
#'        in the url of the dataset or on the download page of the dataset.
#' @param metadata Can be either a file path or the id of a dataset.
#' @return The function returns a dataframe in case of a single dataset and a list of objects in case
#'         of a paper proposal as well as for multiple datasets defined via ids. An error is thrown when
#'         the dataset or proposal is not found or you don't have the proper access right to perform
#'         the action. For detailed informations about the used functions see \code{\link{bef.portal.get.dataset}} and
#'         \code{\link{bef.portal.get.proposal}}.
#'
#' @examples \dontrun{
#'      dataset = bef.portal.get(dataset_id = 8)
#'      metadata = bef.portal.get(metadata = "/path/to/21.eml")
#'      metadata = bef.portal.get(metadata = 21)
#'  }
#' @import RCurl
#' @export

bef.portal.get <- function(dataset_id, metadata) {
    warning("This wrapper will be removed in the next version of this package. Please use the appropriate function four your task!")

    if (!missing(metadata)) {
        dataset = bef.portal.get.metadata(given = metadata)
        warning("use ... instead")
        return(dataset)
    }

    if (!missing(dataset_id)) {
        dataset = bef.portal.get.dataset(id = dataset_id)
        warning("use ... instead")
        return(dataset)
    }
}
