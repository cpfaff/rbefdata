#' This is a helper file that contains functions used by the BEFdata R package 
#' Internally.
#'
#' @import RCurl 
#' @export

bef.combineObjects <- function(dataset_object, dataset_url, metadata_object, metadata_url) 
  {  
    if(!missing(metadata_url)) 
      { 
        metadata = bef.getMetadata(full_url=metadata_url)  
        dataset = dataset_object
      } 
    
    if(!missing(dataset_url)) 
      { 
        dataset = bef.getDataset(full_url=dataset_url) 
        metadata = metadata_objet 
      } 

    if(!missing(dataset_object) && !missing(metadata_object))
      { 
        dataset = dataset_object 
        metadata = metadata_object
      } 

    attr(dataset, "title") = metadata$title
    attr(dataset, "authors") = metadata$authors
    attr(dataset, "abstract") = metadata$abstract
    attr(dataset, "taxonicextent") = metadata$taxonicextent
    attr(dataset, "spatial_information") = metadata$spatial
    attr(dataset, "temporal_information") = metadata$temporal 
    attr(dataset, "sampling") = metadata$temporal 
    attr(dataset, "analyze") = metadata$analyze

    return(dataset)
  }

bef.prepareUrl <- function (full_url, category_split=T) 
  { 
    # url options 
    include_via = "?" 
    append_via = "&" 

    # no options set in url
    if(!grepl(full_url, pattern=include_via))
      {
       a=2 
      }

    if(category_split) 
      grep
    }
