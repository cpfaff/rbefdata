#' Defunct functions in package rbefdata
#'
#' These following functions are renamed or removed. Please use new functions instead.
#'
#' \tabular{ll}{
#'  \strong{Defunct functions} \tab \strong{Replacement} \cr
#'  \code{bef.getdata} \tab \code{\link{bef.portal.get}} \cr
#'  \code{bef.getDataset} \tab \code{\link{bef.portal.get.dataset}} \cr
#'  \code{bef.getMetadata} \tab \code{\link{bef.portal.get.metadata}} \cr
#'  \code{bef.getKeywords} \tab \code{\link{bef.portal.get.keywords}} \cr
#'  \code{bef.getProposal} \tab \code{\link{bef.portal.get.proposal}} \cr
#'  \code{bef.searchTematres} \tab \code{\link{bef.tematres.search.keywords}} \cr
#'  \code{bef.searchTematresLower} \tab \code{\link{bef.tematres.search.narrower_keywords}} \cr
#'  \code{bef.searchTematresUpper} \tab \code{\link{bef.tematres.search.broader_keywords}} \cr
#' }
#'
#' @name rbefdata-defunct
#' @aliases bef.getDataset bef.getKeywords bef.getMetadata bef.getProposal bef.searchTematres bef.searchTematresLower bef.searchTematresUpper
#' @export bef.getDataset bef.getKeywords bef.getMetadata bef.getProposal bef.searchTematres bef.searchTematresLower bef.searchTematresUpper
#' @keywords internal
#'

## defunct with version 0.4
#' @rdname rbefdata-defunct
bef.getDataset <- function(...) {
  .Defunct("bef.portal.get.dataset")
}
#' @rdname rbefdata-defunct
bef.getKeywords <- function() {
  .Defunct("bef.portal.get.keywords")
}
#' @rdname rbefdata-defunct
bef.getMetadata <- function(...) {
  .Defunct("bef.portal.get.metadata")
}
#' @rdname rbefdata-defunct
bef.getProposal <- function(...) {
  .Defunct("bef.portal.get.proposal")
}
#' @rdname rbefdata-defunct
bef.searchTematres <- function(...) {
  .Defunct("bef.tematres.search.keywords")
}
#' @rdname rbefdata-defunct
bef.searchTematresLower <- function(...) {
  .Defunct("bef.tematres.search.narrower_keywords")
}
#' @rdname rbefdata-defunct
bef.searchTematresUpper <- function(...) {
  .Defunct("bef.tematres.search.broader_keywords")
}
