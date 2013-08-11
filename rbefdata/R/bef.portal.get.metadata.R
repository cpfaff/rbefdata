#' Get the metadata of a dataset from the BEFdata portal
#'
#' This function fetches the metadata associated with a dataset on a BEFdata portal.
#' You need to provide the id of the dataset. You can find the url on the dataset page.
#'
#' @param given This is either a dataset id or a file path to a metadata eml file.
#'
#' @return A list of metadata. metadata that doesn't exist is represented as \code{NA}
#' @import XML
#' @export
#'

bef.portal.get.metadata <- function(given) {
  if(is.character(given)) {
    full_url = given
  } else {
    full_url = dataset_url(given, "eml", separate_category_columns=TRUE)
  }

  metadata = xmlTreeParse(full_url, useInternalNodes = T)

  template = list(
    title = "//dataset/title",
    abstract = "//dataset/abstract/para",
    taxonomicextent = "//dataset//generalTaxonomicCoverage",
    sampling = "//dataset//samplingDescription/para",
    spatial_information = list(
      description = "//geographicCoverage/geographicDescription",
      coordinates = c(west = "//geographicCoverage/boundingCoordinates/westBoundingCoordinate",
                    east = "//geographicCoverage/boundingCoordinates/eastBoundingCoordinate",
                    north = "//geographicCoverage/boundingCoordinates/northBoundingCoordinate",
                    south = "//geographicCoverage/boundingCoordinates/southBoundingCoordinate")),
    temporal_information = c(begin = "//temporalCoverage//beginDate", end = "//temporalCoverage//endDate"),
    authors = list(
      firstname = "//creator/individualName/givenName",
      lastname = "//creator/individualName/surName",
      email = "//creator/electronicMailAddress"),
    keywords = "//keyword"
  )

  out = rapply(template, function(x) xmlNodesValue(path=x, doc=metadata), how="replace")
  out$authors = as.data.frame(out$authors, stringsAsFactors=F)

  attributeList = getNodeSet(metadata, path="//attributeList/attribute")
  column_template = list(header = "./attributeLabel",
                         description = "./attributeDefinition",
                         unit = ".//unit",
                         info = ".//attributeName"
                         )
  columns = lapply(column_template, function(c) {
    sapply(attributeList, function(d) {
      xmlNodesValue(doc=d, path=c)
    })
  })
  columns = as.data.frame(columns, stringsAsFactors=F)

  if (nrow(columns)) {
    columns$unit = as.character(columns$unit)
    columns$unit[is.na(columns$unit) | columns$unit == "dimensionless"] = "dimensionless"
    out$columns = columns
  }

  return(out)
}
