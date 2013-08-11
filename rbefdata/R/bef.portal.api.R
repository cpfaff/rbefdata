#' Basic api to the BEFdata portal
#'
#' This function returns the information available for a dataset.
#'
#' @param given Is an id of the dataset you like to get the information for. You find
#'  	  the id in the url of the dataset on the portal page.
#' @return Returns a list of metadata information for a dataset.
#' @import RCurl
#' @import XML
#' @export

bef.portal.api.dataset.metadata <- function(given) {
  full_url = dataset_url(given, "xml", separate_category_columns=TRUE)

  metadata = xmlTreeParse(full_url, useInternalNodes = T)

  template = list(title = "//dataset/title",
		  abstract = "//dataset/abstract",
		  taxonomicextent = "//dataset/taxonomicextent",
		  spatialextent = "//dataset/spatialextent",
		  temporalextent = list(begindate = "//dataset/temporalextent/begin",
					enddate = "//dataset/temporalextent/begin"),
		  design = "//dataset/design",
		  authors = list(authorname = "//dataset/authors/author/name",
				 email = "//dataset/authors/author/email"),
		  projects = "//dataset/projects",
		  accessright = "//dataset/accessRight",
		  urls = list(xls = "//dataset/urls/xls",
			      csv = "//dataset/urls/csv"),
		  keywords = "//dataset/keywordSet",
		  attachment = "//dataset/attachments"
		  )

  extracted_metadata = rapply(template, function(x) xmlNodesValue(path=x, doc=metadata), how="replace")
  extracted_metadata$authors = as.data.frame(extracted_metadata$authors, stringsAsFactors=F)

  column_set = getNodeSet(metadata, path="//dataset/columns/column")

  column_template = list(header = "./header",
			 definition = "./definition",
			 unit = "./unit",
			 type = "./type",
			 instrumentation = "./instrumentation",
			 reference = "./reference")

  column_metadata = lapply(column_template, function(c) {
    sapply(column_set, function(d) {
      xmlNodesValue(doc=d, path=c)
    })
  })

  extracted_metadata$column_metadata = as.data.frame(column_metadata, stringsAsFactors=F)

  keyword_set = getNodeSet(metadata, path="//dataset/columns/column/keywordSet")
  column_template = list(keywordSet = "./keyword")

  column_keywords = lapply(column_template, function(c) {
    lapply(keyword_set, function(d) {
      xmlNodesValue(doc=d, path=c)
    })
  })

  extracted_metadata$column_keywords = column_keywords
  return(extracted_metadata)
}

