% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rbefdata_deprecated.R
\name{rbefdata_deprecated}
\alias{rbefdata_deprecated}
\alias{bef.portal.get.datasets.for_keyword}
\alias{bef.portal.get.dataset_list}
\alias{bef.portal.get.proposal}
\alias{bef.get.dataset}
\alias{bef.get.dataset_by}
\alias{bef.portal.get.dataset_by}
\alias{bef.portal.get.dataset}
\alias{bef.get.metadata}
\alias{bef.get.metadata_for}
\alias{bef.portal.get.metadata}
\alias{bef.portal.get.metadata_for}
\alias{bef.get.attachments}
\alias{bef.get.attachments_for}
\alias{bef.portal.get.attachments}
\alias{bef.portal.get.attachments_for}
\alias{bef.portal.datagroup}
\alias{bef.portal.get.datagroup}
\alias{bef.portal.get.categories_for}
\alias{bef.get.categories_for}
\alias{bef.portal.get.keywords}
\alias{bef.get.keywords}
\alias{bef.options}
\alias{bef.attach.to_dataset}
\alias{bef.portal.attach.to_dataset}
\alias{bef.portal.vizualize.keywords}
\alias{bef.vizualize.keywords}
\alias{bef.portal.upload.dataset}
\alias{bef.upload.dataset}
\alias{bef.attach.to_proposal}
\alias{bef.portal.attach.to_proposal}
\alias{bef.portal.upload.categories}
\alias{bef.upload.categories}
\alias{bef.get.datasets.for_keyword}
\alias{bef.portal.update.dataset}
\alias{bef.update.dataset}
\title{Deprecated functions in package rbefdata}
\usage{
bef.portal.get.datasets.for_keyword(...)

bef.get.datasets.for_keyword(...)

bef.portal.get.dataset_list(...)

bef.portal.get.proposal(...)

bef.get.dataset(...)

bef.get.dataset_by(...)

bef.portal.get.dataset_by(...)

bef.portal.get.dataset(...)

bef.get.metadata(...)

bef.get.metadata_for(...)

bef.portal.get.metadata(...)

bef.portal.get.metadata_for(...)

bef.get.attachments(...)

bef.get.attachments_for(...)

bef.portal.get.attachments(...)

bef.portal.get.attachments_for(...)

bef.portal.get.datagroup(...)

bef.portal.datagroup(...)

bef.portal.get.categories_for(...)

bef.get.categories_for(...)

bef.portal.get.keywords(...)

bef.get.keywords(...)

bef.options(...)

bef.portal.attach.to_dataset(...)

bef.attach.to_dataset(...)

bef.portal.vizualize.keywords(...)

bef.vizualize.keywords(...)

bef.upload.dataset(...)

bef.portal.upload.dataset(...)

bef.portal.update.dataset(...)

bef.update.dataset(...)

bef.portal.attach.to_proposal(...)

bef.attach.to_proposal(...)

bef.portal.upload.categories(datagroup_id, categories,
  curl = getCurlHandle())

bef.upload.categories(datagroup_id, categories, curl = getCurlHandle())
}
\description{
These following functions are renamed or removed. Please use new functions instead.
}
\details{
\tabular{ll}{
 \strong{Deprecated functions} \tab \strong{Replacement} \cr
 \code{bef.portal.get.dataset_list} \tab \code{\link{bef.portal.get.datasets.for_keyword}} \cr
 \code{bef.get.datasets.for_keyword} \tab \code{\link{bef.portal.get.datasets.for_keyword}} \cr
 \code{bef.portal.get.proposal} \tab \code{\link{bef.portal.get.datasets.for_proposal}} \cr
 \code{bef.get.dataset} \tab \code{\link{get_dataset}} \cr
 \code{bef.get.dataset_by} \tab \code{\link{get_dataset}} \cr
 \code{bef.portal.get.dataset_by} \tab \code{\link{get_dataset}} \cr
 \code{bef.portal.get.dataset} \tab \code{\link{get_dataset}} \cr
 \code{bef.get.metadata} \tab \code{\link{get_metadata}} \cr
 \code{bef.get.metadata_for} \tab \code{\link{get_metadata}} \cr
 \code{bef.portal.get.metadata} \tab \code{\link{get_metadata}} \cr
 \code{bef.portal.get.metadata_for} \tab \code{\link{get_metadata}} \cr
 \code{bef.get.attachments} \tab \code{\link{get_dataset_attachment}} \cr
 \code{bef.get.attachments_for} \tab \code{\link{get_dataset_attachment}} \cr
 \code{bef.portal.get.attachments} \tab \code{\link{get_dataset_attachment}} \cr
 \code{bef.portal.get.attachments_for} \tab \code{\link{get_dataset_attachment}} \cr
 \code{bef.portal.datagroup} \tab \code{\link{get_datagroup}} \cr
 \code{bef.portal.get.datagroup} \tab \code{\link{get_datagroup}} \cr
 \code{bef.portal.get.categories_for} \tab \code{\link{get_datagroup_category}} \cr
 \code{bef.get.categories_for} \tab \code{\link{get_datagroup_category}} \cr
 \code{bef.portal.get.keywords} \tab \code{\link{get_dataset_keyword}} \cr
 \code{bef.portal.get.keywords} \tab \code{\link{get_dataset_keyword}} \cr
 \code{bef.options} \tab \code{\link{bef_options}} \cr
 \code{bef.attach.to_dataset} \tab \code{\link{add_dataset_attachment}} \cr
 \code{bef.portal.attach.to_dataset} \tab \code{\link{add_dataset_attachment}} \cr
 \code{bef.portal.vizualize.keywords} \tab \code{\link{plot_keyword}} \cr
 \code{bef.vizualize.keywords} \tab \code{\link{plot_keyword}} \cr
 \code{bef.portal.upload.dataset} \tab \code{\link{add_dataset}} \cr
 \code{bef.upload.dataset} \tab \code{\link{add_dataset}} \cr
 \code{bef.portal.update.dataset} \tab \code{\link{update_dataset}} \cr
 \code{bef.update.dataset} \tab \code{\link{update_dataset}} \cr
 \code{bef.attach.to_proposal} \tab \code{\link{add_proposal_attachment}} \cr
 \code{bef.portal.attach.to_proposal} \tab \code{\link{add_proposal_attachment}} \cr
 \code{bef.portal.upload.categories} \tab \code{\link{update_datagroup_category}} \cr
 \code{bef.upload.categories} \tab \code{\link{update_datagroup_category}} \cr
}
}
\keyword{internal}
