#' Deprecated functions in package rbefdata
#'
#' These following functions are renamed or removed. Please use new functions instead.
#'
#' \tabular{ll}{
#'  \strong{Deprecated functions} \tab \strong{Replacement} \cr
#'  \code{bef.portal.get.dataset_list} \tab \code{\link{bef.portal.get.datasets.for_keyword}} \cr
#'  \code{bef.get.datasets.for_keyword} \tab \code{\link{bef.portal.get.datasets.for_keyword}} \cr
#'  \code{bef.portal.get.proposal} \tab \code{\link{bef.portal.get.datasets.for_proposal}} \cr
#'  \code{bef.get.dataset} \tab \code{\link{get_dataset}} \cr
#'  \code{bef.get.dataset_by} \tab \code{\link{get_dataset}} \cr
#'  \code{bef.portal.get.dataset_by} \tab \code{\link{get_dataset}} \cr
#'  \code{bef.portal.get.dataset} \tab \code{\link{get_dataset}} \cr
#'  \code{bef.get.metadata} \tab \code{\link{get_metadata}} \cr
#'  \code{bef.get.metadata_for} \tab \code{\link{get_metadata}} \cr
#'  \code{bef.portal.get.metadata} \tab \code{\link{get_metadata}} \cr
#'  \code{bef.portal.get.metadata_for} \tab \code{\link{get_metadata}} \cr
#'  \code{bef.get.attachments} \tab \code{\link{get_dataset_attachment}} \cr
#'  \code{bef.get.attachments_for} \tab \code{\link{get_dataset_attachment}} \cr
#'  \code{bef.portal.get.attachments} \tab \code{\link{get_dataset_attachment}} \cr
#'  \code{bef.portal.get.attachments_for} \tab \code{\link{get_dataset_attachment}} \cr
#'  \code{bef.portal.datagroup} \tab \code{\link{get_datagroup}} \cr
#'  \code{bef.portal.get.datagroup} \tab \code{\link{get_datagroup}} \cr
#'  \code{bef.portal.get.categories_for} \tab \code{\link{get_datagroup_category}} \cr
#'  \code{bef.get.categories_for} \tab \code{\link{get_datagroup_category}} \cr
#'  \code{bef.portal.get.keywords} \tab \code{\link{get_dataset_keyword}} \cr
#'  \code{bef.portal.get.keywords} \tab \code{\link{get_dataset_keyword}} \cr
#'  \code{bef.options} \tab \code{\link{bef_options}} \cr
#'  \code{bef.attach.to_dataset} \tab \code{\link{add_dataset_attachment}} \cr
#'  \code{bef.portal.attach.to_dataset} \tab \code{\link{add_dataset_attachment}} \cr
#'  \code{bef.portal.vizualize.keywords} \tab \code{\link{plot_keyword}} \cr
#'  \code{bef.vizualize.keywords} \tab \code{\link{plot_keyword}} \cr
#'  \code{bef.portal.upload.dataset} \tab \code{\link{add_dataset}} \cr
#'  \code{bef.upload.dataset} \tab \code{\link{add_dataset}} \cr
#'  \code{bef.portal.update.dataset} \tab \code{\link{update_dataset}} \cr
#'  \code{bef.update.dataset} \tab \code{\link{update_dataset}} \cr
#'  \code{bef.attach.to_proposal} \tab \code{\link{add_proposal_attachment}} \cr
#'  \code{bef.portal.attach.to_proposal} \tab \code{\link{add_proposal_attachment}} \cr
#'  \code{bef.portal.upload.categories} \tab \code{\link{update_datagroup_category}} \cr
#'  \code{bef.upload.categories} \tab \code{\link{update_datagroup_category}} \cr
#' }
#' @name rbefdata_deprecated
#' @aliases bef.portal.get.dataset_list bef.portal.get.proposal bef.get.dataset bef.get.dataset_by bef.portal.get.dataset_by bef.portal.get.dataset bef.get.metadata bef.get.metadata_for bef.portal.get.metadata bef.portal.get.metadata_for bef.get.attachments bef.get.attachments_for bef.portal.get.attachments bef.portal.get.attachments_for bef.portal.datagroup bef.portal.get.datagroup bef.portal.get.categories_for bef.get.categories_for bef.portal.get.keywords bef.get.keywords bef.options bef.attach.to_dataset bef.portal.attach.to_dataset bef.portal.vizualize.keywords bef.vizualize.keywords bef.portal.upload.dataset bef.upload.dataset bef.attach.to_proposal bef.portal.attach.to_proposal bef.portal.upload.categories bef.upload.categories bef.get.datasets.for_keyword bef.portal.get.datasets.for_keyword
#' @export bef.portal.get.dataset_list bef.portal.get.proposal bef.get.dataset bef.get.dataset_by bef.portal.get.dataset_by bef.portal.get.dataset bef.get.metadata bef.get.metadata_for bef.portal.get.metadata bef.portal.get.metadata_for bef.get.attachments bef.get.attachments_for bef.portal.get.attachments bef.portal.get.attachments_for bef.portal.datagroup bef.portal.get.datagroup bef.portal.get.categories_for bef.get.categories_for bef.portal.get.keywords bef.get.keywords bef.options bef.attach.to_dataset bef.portal.attach.to_dataset bef.portal.vizualize.keywords bef.vizualize.keywords bef.portal.upload.dataset bef.upload.dataset bef.attach.to_proposal bef.portal.attach.to_proposal bef.portal.upload.categories bef.upload.categories bef.get.datasets.for_keyword bef.portal.get.datasets.for_keyword
#' @keywords internal 

#' @rdname rbefdata_deprecated
bef.portal.get.datasets.for_keyword <- function(...) {
  .Deprecated("get_dataset_by_keyword")
  get_dataset_by_keyword(...)
  
}

#' @rdname rbefdata_deprecated
bef.get.datasets.for_keyword <- function(...) {
  .Deprecated("get_dataset_by_keyword")
  get_dataset_by_keyword(...)
  
}

#' @rdname rbefdata_deprecated
bef.portal.get.dataset_list <- function(...) {
  .Deprecated("get_dataset_by_keyword")
  get_dataset_by_keyword(...)
  
}

#' @rdname rbefdata_deprecated
bef.portal.get.proposal <- function(...) {
  .Deprecated("bef.portal.get.datasets_for_proposal")
  bef.portal.get.datasets.for_proposal(...)
}

#' @rdname rbefdata_deprecated
bef.get.dataset <- function(...) {
  .Deprecated("get_dataset")
  get_dataset(...)
}

#' @rdname rbefdata_deprecated
bef.get.dataset_by <- function(...) {
  .Deprecated("get_dataset")
  get_dataset(...)
}

#' @rdname rbefdata_deprecated
bef.portal.get.dataset_by <- function(...) {
  .Deprecated("get_dataset")
  get_dataset(...)
}

#' @rdname rbefdata_deprecated
bef.portal.get.dataset <- function(...) {
  .Deprecated("get_dataset")
  get_dataset(...)
}

#' @rdname rbefdata_deprecated
bef.get.metadata <- function(...) {
  .Deprecated("get_metadata")
  get_metadata(...)
}

#' @rdname rbefdata_deprecated
bef.get.metadata_for <- function(...) {
  .Deprecated("get_metadata")
  get_metadata(...)
}

#' @rdname rbefdata_deprecated
bef.portal.get.metadata <- function(...) {
  .Deprecated("get_metadata")
  get_metadata(...)
}

#' @rdname rbefdata_deprecated
bef.portal.get.metadata_for <- function(...) {
  .Deprecated("get_metadata")
  get_metadata(...)
}

#' @rdname rbefdata_deprecated
bef.get.attachments <- function(...) {
  .Deprecated("get_dataset_attachment")
  get_dataset_attachment(...)
}

#' @rdname rbefdata_deprecated
bef.get.attachments_for <- function(...) {
  .Deprecated("get_dataset_attachment")
  get_dataset_attachment(...)
}

#' @rdname rbefdata_deprecated
bef.portal.get.attachments <- function(...) {
  .Deprecated("get_dataset_attachment")
  get_dataset_attachment(...)
}

#' @rdname rbefdata_deprecated
bef.portal.get.attachments_for <- function(...) {
  .Deprecated("get_dataset_attachment")
  get_dataset_attachment(...)
}

#' @rdname rbefdata_deprecated
bef.portal.get.datagroup <- function(...) {
  .Deprecated("get_datagroup")
  get_datagroup(...)
}

#' @rdname rbefdata_deprecated
bef.portal.datagroup <- function(...) {
  .Deprecated("get_datagroup")
  get_datagroup(...)
}

#' @rdname rbefdata_deprecated
bef.portal.get.categories_for <- function(...) {
  .Deprecated("get_datagroup_category")
  get_datagroup_category(...)
}

#' @rdname rbefdata_deprecated
bef.get.categories_for <- function(...) {
  .Deprecated("get_datagroup_category")
  get_datagroup_category(...)
}

#' @rdname rbefdata_deprecated
bef.portal.get.keywords <- function(...) {
  .Deprecated("get_keyword_stats")
  get_dataset_keyword(...)
}

#' @rdname rbefdata_deprecated
bef.get.keywords <- function(...) {
  .Deprecated("get_keyword_stats")
  get_dataset_keyword(...)
}

#' @rdname rbefdata_deprecated
bef.options <- function(...) {
  .Deprecated("bef_options")
  bef_options(...)
}

#' @rdname rbefdata_deprecated
bef.portal.attach.to_dataset <- function(...) {
  .Deprecated("add_dataset_attachment")
  add_dataset_attachment(...)
}

#' @rdname rbefdata_deprecated
bef.attach.to_dataset <- function(...) {
  .Deprecated("add_dataset_attachment")
  add_dataset_attachment(...)
}

#' @rdname rbefdata_deprecated
bef.portal.vizualize.keywords  <- function(...) {
  .Deprecated("plot_keyword")
  plot_keyword(...)
}

#' @rdname rbefdata_deprecated
bef.vizualize.keywords  <- function(...) {
  .Deprecated("plot_keyword")
  plot_keyword(...)
}

#' @rdname rbefdata_deprecated
bef.upload.dataset  <- function(...) {
  .Deprecated("add_dataset")
  add_dataset(...)
}

#' @rdname rbefdata_deprecated
bef.portal.upload.dataset  <- function(...) {
  .Deprecated("add_dataset")
  add_dataset(...)
}

#' @rdname rbefdata_deprecated
bef.portal.update.dataset  <- function(...) {
  .Deprecated("update_dataset")
  update_dataset(...)
}

#' @rdname rbefdata_deprecated
bef.update.dataset  <- function(...) {
  .Deprecated("update_dataset")
  update_dataset(...)
}

#' @rdname rbefdata_deprecated
bef.portal.attach.to_proposal  <- function(...) {
  .Deprecated("add_proposal_attachment")
  add_proposal_attachment(...)
}

#' @rdname rbefdata_deprecated
bef.attach.to_proposal  <- function(...) {
  .Deprecated("add_proposal_attachment")
  add_proposal_attachment(...)
}

#' @rdname rbefdata_deprecated
bef.portal.upload.categories  <- function(...) {
  .Deprecated("update_datagroup_category")
  update_datagroup_category(...)
}

#' @rdname rbefdata_deprecated
bef.upload.categories  <- function(...) {
  .Deprecated("update_datagroup_category")
  update_datagroup_category(...)
}
