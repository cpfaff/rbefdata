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
#'  \code{bef.get.metadata_for} \tab \code{\link{get_metadata}} \cr
#'  \code{bef.portal.get.metadata} \tab \code{\link{get_metadata}} \cr
#'  \code{bef.portal.get.metadata_for} \tab \code{\link{get_metadata}} \cr
#'  \code{bef.get.attachments} \tab \code{\link{get_dataset_attachment}} \cr
#'  \code{bef.get.attachments_for} \tab \code{\link{get_dataset_attachment}} \cr
#'  \code{bef.portal.get.attachments} \tab \code{\link{get_dataset_attachment}} \cr
#'  \code{bef.portal.get.attachments_for} \tab \code{\link{get_dataset_attachment}} \cr
#'  \code{bef.portal.datagroup} \tab \code{\link{get_datagroup}} \cr
#'  \code{bef.portal.get.datagroup} \tab \code{\link{get_datagroup}} \cr
#' }
#' bef.portal.get.dataset_list
#' @name rbefdata-deprecated
#' @aliases bef.portal.get.dataset_list bef.portal.get.proposal bef.tematres.api bef.get.dataset bef.get.dataset_by bef.portal.get.dataset_by bef.portal.get.dataset bef.get.metadata bef.get.metadata_for bef.portal.get.metadata bef.portal.get.metadata_for bef.get.attachments bef.get.attachments_for bef.portal.get.attachments bef.portal.get.attachments_for bef.portal.datagroup bef.portal.get.datagroup
#' @export bef.portal.get.dataset_list bef.portal.get.proposal bef.tematres.api bef.get.dataset bef.get.dataset_by bef.portal.get.dataset_by bef.portal.get.dataset bef.get.metadata bef.get.metadata_for bef.portal.get.metadata bef.portal.get.metadata_for bef.get.attachments bef.get.attachments_for bef.portal.get.attachments bef.portal.get.attachments_for bef.portal.datagroup bef.portal.get.datagroup
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

#' @rdname rbefdata-deprecated
bef.get.metadata <- function(...) {
  .Deprecated("get_metadata")
  get_metadata(...)
}

#' @rdname rbefdata-deprecated
bef.get.metadata_for <- function(...) {
  .Deprecated("get_metadata")
  get_metadata(...)
}

#' @rdname rbefdata-deprecated
bef.portal.get.metadata <- function(...) {
  .Deprecated("get_metadata")
  get_metadata(...)
}

#' @rdname rbefdata-deprecated
bef.portal.get.metadata_for <- function(...) {
  .Deprecated("get_metadata")
  get_metadata(...)
}

#' @rdname rbefdata-deprecated
bef.get.attachments <- function(...) {
  .Deprecated("get_dataset_attachment")
  get_dataset_attachment(...)
}

#' @rdname rbefdata-deprecated
bef.get.attachments_for <- function(...) {
  .Deprecated("get_dataset_attachment")
  get_dataset_attachment(...)
}

#' @rdname rbefdata-deprecated
bef.portal.get.attachments <- function(...) {
  .Deprecated("get_dataset_attachment")
  get_dataset_attachment(...)
}

#' @rdname rbefdata-deprecated
bef.portal.get.attachments_for <- function(...) {
  .Deprecated("get_dataset_attachment")
  get_dataset_attachment(...)
}

#' @rdname rbefdata-deprecated
bef.portal.get.datagroup <- function(...) {
  .Deprecated("get_datagroup")
  get_datagroup(...)
}

#' @rdname rbefdata-deprecated
bef.portal.datagroup <- function(...) {
  .Deprecated("get_datagroup")
  get_datagroup(...)
}


