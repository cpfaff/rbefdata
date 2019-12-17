#' Deprecated functions in package rbefdata
#'
#' These following functions are renamed or removed. Please use new functions instead.
#'
#' \tabular{ll}{
#'  \strong{Deprecated functions} \tab \strong{Replacement} \cr
#'  \code{bef.portal.get.dataset_list} \tab \code{\link{bef.portal.get.datasets.for_keyword}} \cr
#'  \code{bef.portal.get.proposal} \tab \code{\link{bef.portal.get.datasets.for_proposal}} \cr
#'  \code{bef.tematres.api} \tab \code{\link{bef.tematres}} \cr
#'  \code{bef.get.dataset} \tab \code{\link{get_dataset}} \cr
#'  \code{bef.get.dataset_by} \tab \code{\link{get_dataset}} \cr
#'  \code{bef.portal.get.dataset_by} \tab \code{\link{get_dataset}} \cr
#'  \code{bef.portal.get.dataset} \tab \code{\link{get_dataset}} \cr
#' }
#' bef.portal.get.dataset_list
#' @name rbefdata-deprecated
#' @aliases bef.portal.get.dataset_list bef.portal.get.proposal bef.tematres.api bef.get.dataset bef.get.dataset_by bef.portal.get.dataset_by bef.portal.get.dataset
#' @export bef.portal.get.dataset_list bef.portal.get.proposal bef.tematres.api bef.get.dataset bef.get.dataset_by bef.portal.get.dataset_by bef.portal.get.dataset
#' @keywords internal

#' @rdname rbefdata-deprecated
bef.portal.get.dataset_list <- function(...) {
  .Deprecated("bef.portal.get.datasets_for_keyword")
  bef.portal.get.datasets.for_keyword(...)
}

#' @rdname rbefdata-deprecated
bef.portal.get.proposal <- function(...) {
  .Deprecated("bef.portal.get.datasets_for_proposal")
  bef.portal.get.datasets.for_proposal(...)
}

#' @rdname rbefdata-deprecated
bef.tematres.api <- function(...) {
  .Deprecated("bef.tematres")
  bef.tematres(...)
}

#' @rdname rbefdata-deprecated
bef.get.dataset <- function(...) {
  .Deprecated("get_dataset")
  get_dataset(...)
}

#' @rdname rbefdata-deprecated
bef.get.dataset_by <- function(...) {
  .Deprecated("get_dataset")
  get_dataset(...)
}

#' @rdname rbefdata-deprecated
bef.portal.get.dataset_by <- function(...) {
  .Deprecated("get_dataset")
  get_dataset(...)
}

#' @rdname rbefdata-deprecated
bef.portal.get.dataset <- function(...) {
  .Deprecated("get_dataset")
  get_dataset(...)
}
