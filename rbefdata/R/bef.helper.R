#' This is a helper file that contains functions used by the BEFdata R package
#' Internally.
#'
#' @import RCurl
#' @import XML
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

bef.searchTematres <- function(lookup_keyword)
  {
    service_task="search"
    service_argument=lookup_keyword
    service_url=paste("http://vocab.lternet.edu/vocab/luq/services.php?task=",service_task,"&arg=",service_argument, sep="")

    search_fetch_xml=getURL(service_url)
    search_parse_xml=xmlTreeParse(search_fetch_xml, getDTD=F)
    search_get_xml_root <<- xmlRoot(search_parse_xml)

    if (length(grep("^result$",names(search_get_xml_root))) == 1)
      {
        search_get_results=search_get_xml_root[[1]]
        search_get_results_names=""

        for (i in 1:xmlSize(search_get_results))
          {
            search_get_results_names[i]=xmlSApply(search_get_xml_root[[1]][[i]][[2]], xmlValue)
          }

        return(search_get_results_names)

      }else{
        stop("The server says: No terms available for your search")
      }
  }

bef.searchTematresUpper <- function(lookup_keyword)
  {

    service_task="search"
    service_argument=lookup_keyword
    service_url=paste("http://vocab.lternet.edu/vocab/luq/services.php?task=",service_task,"&arg=",service_argument, sep="")

    search_fetch_xml=getURL(service_url)
    search_parse_xml=xmlTreeParse(search_fetch_xml, getDTD=F)
    search_get_xml_root=xmlRoot(search_parse_xml)

    if (length(grep("^result$",names(search_get_xml_root))) == 1)
      {
        search_get_results=search_get_xml_root[[1]]
        search_get_results_names=""


        for (i in 1:xmlSize(search_get_results)){
          search_get_results_names[i]=xmlSApply(search_get_xml_root[[1]][[i]][[2]], xmlValue)
        }


        if(length(grep(paste("^",service_argument,"$",sep=""),search_get_results_names,value=F)) == 1)
          {

            variable_index=which(search_get_results_names == lookup_keyword)
            get_id=xmlValue(search_get_xml_root[[1]][[variable_index]][[1]])

            service_task="fetchUp"
            service_argument=get_id

            fetch_upward_keywords=getURL(paste("http://www1.vcrlter.virginia.edu/data/vocab/tematres/luq//services.php?task=fetchUp&arg=",get_id,sep=""))

            process_upward_keywords=xmlTreeParse(fetch_upward_keywords, getDTD=F)
            upward_root=xmlRoot(process_upward_keywords)

            upward_root_results=upward_root[[1]]

            upward_root_results_length=xmlSize(upward_root[[1]])
            upward_root_results_varnames=""

              for (j in 1:upward_root_results_length){
                upward_root_results_varnames[j]=xmlValue(upward_root_results[[j]][[2]][[1]])
              }

              return(upward_root_results_varnames)

          }
        }else{
          stop("No Terms available for your search")
      }
  }


bef.searchTematresLower = function(lookup_keyword)
  {
    service_task="search"
    service_argument=lookup_keyword
    service_url=paste("http://vocab.lternet.edu/vocab/luq/services.php?task=",service_task,"&arg=",service_argument, sep="")

    search_fetch_xml=getURL(service_url)
    search_parse_xml=xmlTreeParse(search_fetch_xml, getDTD=F)
    search_get_xml_root <<- xmlRoot(search_parse_xml)

    if (length(grep("^result$",names(search_get_xml_root))) == 1)
      {
        search_get_results=search_get_xml_root[[1]]
        search_get_results_names=""
        for (i in 1:xmlSize(search_get_results))
          {
            search_get_results_names[i]=xmlSApply(search_get_xml_root[[1]][[i]][[2]], xmlValue)
          }
      } else {
        stop("The server says: No terms available for your search")
      }

    variable_index=grep(paste("^",service_argument,"$","|","^",service_argument,"s","$", sep=""), search_get_results_names, ignore.case = T)
    get_id=xmlValue(search_get_xml_root[[1]][[variable_index]][[1]])

    service_task="fetchDown"
    service_argument=get_id

    fetch_upward_keywords=getURL(paste("http://www1.vcrlter.virginia.edu/data/vocab/tematres/luq//services.php?task=",service_task,"&arg=",get_id,sep=""))

    process_upward_keywords=xmlTreeParse(fetch_upward_keywords, getDTD=F)

    if (length(grep("^result$",names(process_upward_keywords[[1]]))) == 1)
      {
        upward_root=xmlRoot(process_upward_keywords)
        upward_root_results=upward_root[[1]]
        upward_root_results_length=xmlSize(upward_root[[1]])
        upward_root_results_varnames=""

        for (j in 1:upward_root_results_length)
          {
            upward_root_results_varnames[j]=xmlValue(upward_root_results[[j]][[2]][[1]])
          }

        print(upward_root_results_varnames)
    }
  }
