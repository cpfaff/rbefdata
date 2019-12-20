#' Defunct functions in package rbefdata
#'
#' These following functions are renamed or removed. Please use new functions instead.
#'
#' \tabular{ll}{
#'  \strong{Defunct functions} \tab \strong{Replacement} \cr
#'  \code{bef.getDataset} \tab \code{\link{bef.portal.get.dataset}} \cr
#'  \code{bef.getMetadata} \tab \code{\link{bef.portal.get.metadata}} \cr
#'  \code{bef.getKeywords} \tab \code{\link{bef.portal.get.keywords}} \cr
#'  \code{bef.getProposal} \tab \code{\link{bef.portal.get.proposal}} \cr
#'  \code{bef.portal.get} \tab no replacement \cr
#'  \code{bef.tematres.api} \tab no replacement \cr
#'  \code{bef.tematres} \tab no replacement \cr
#'  \code{bef.mediawiki.api.define} \tab no replacement \cr
#'  \code{bef.portal.api.dataset_info} \tab no replacement \cr
#'  \code{bef.portal.api.proposal_info} \tab no replacement \cr
#' }
#'
#' @name rbefdata_defunct
#' @aliases bef.getDataset bef.getKeywords bef.getMetadata bef.getProposal bef.portal.get bef.tematres.api bef.mediawiki.api.define bef.portal.api.dataset_info bef.portal.api.proposal_info
#' @export bef.getDataset bef.getKeywords bef.getMetadata bef.getProposal bef.portal.get bef.tematres bef.mediawiki.api.define bef.portal.api.dataset_info bef.portal.api.proposal_info
#' @keywords internal
#'

## defunct with version 0.4

#' @rdname rbefdata_defunct
bef.getDataset <- function(...) {
  .Defunct("bef.portal.get.dataset")
}

#' @rdname rbefdata_defunct
bef.getKeywords <- function() {
  .Defunct("bef.portal.get.keywords")
}

#' @rdname rbefdata_defunct
bef.getMetadata <- function(...) {
  .Defunct("bef.portal.get.metadata")
}

#' @rdname rbefdata_defunct
bef.getProposal <- function(...) {
  .Defunct("bef.portal.get.proposal")
}

#' @rdname rbefdata_defunct
bef.portal.get <- function(...) {
  .Defunct("Use the appropriate function for your task instead of this wrapper, e.g:
	    bef.portal.get.attachments(dataset = 72)
	    bef.portal.get.attachments_for(dataset = 72)
	    bef.portal.get.dataset(id = 72)
	    bef.portal.get.dataset_by(id = 72)
	    bef.portal.get.datasets_for_keyword(keyword = 'explanatory')
	    bef.portal.get.keywords()
	    bef.portal.get.metadata(dataset = 72)
	    bef.portal.get.metadata_for(dataset = 72)
	    bef.portal.get.datasets_for_proposal(id = 7)")
}

## defunct with version 0.5

#' @rdname rbefdata_defunct
bef.tematres.api <- function(...) {
  .Defunct("Tematres functions have been removed from the package")
}

#' @rdname rbefdata_defunct
bef.tematres <- function(...) {
  .Defunct("Tematres functions have been removed from the package")
}

#' @rdname rbefdata_defunct
bef.mediawiki.api.define <- function(...) {
  .Defunct("Mediawiki functions have been removed from the package")
}

#' @rdname rbefdata_defunct
bef.portal.api.dataset_info <- function(...) {
  .Defunct("API access has been removed. Might be readded after a redesign of the portal api")
}

#' @rdname rbefdata_defunct
bef.portal.api.proposal_info <- function(...) {
  .Defunct("API access has been removed. Might be readded after a redesign of the portal api")
} 
