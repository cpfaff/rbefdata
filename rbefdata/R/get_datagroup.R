#' Get information of all or one specifc data group of interest
#'
#' This function fetches a specific or all datagroups on a BEFdata instance. It
#' provides an overview about their title, description the count of columns which
#' use the datagroup and the couhnt of categories inside the group. 
#'
#' @param id The ID of the data groups you are interested in.
#'        the IDs can be found in the URL of each datagroup. 
#'
#' @return Returns a data frame (tibble) with the details about the 
#'         datagroup you are interested in. If you leave the id parameter
#'         empty information about all datagruops will be shown.
#'        
#' @examples
#' \dontrun{
#' bef.portal.get.datagroups(list = T)
#' bef.portal.get.datagroups(reference = "Scientific plant speices name")
#' }
#' @export get_datagroup
#' @importFrom tibble as_tibble

get_datagroup <- function(id = NULL) {
  # check if the credentials are set
  if (bef_options("user_credentials") == "") stop("This function requires the user credentials to be set")

  # set id to datagroups id
  datagroup_id = id

  # when id is NULL get all datagroups
  if (is.null(datagroup_id)) {
    return(as_tibble(get_all_datagroups()))
  }

  # fail when the user passes in wrong variable type
  if (!is.numeric(datagroup_id)){
    stop("Please provide numeric IDs of the datagroups.")
  }

  #get all the datagroups
  all_datagroups = get_all_datagroups()
  datagroup_subset_of_interest = subset(all_datagroups, id %in% datagroup_id)

  # if ids are provided grep them 
  if (length(datagroup_id) == 1){
    # when the datagroup is not found stop here
    if(!dim(datagroup_subset_of_interest)[1] == length(datagroup_id)){
      stop("The datagroup you requested does not exist. Check your ID")
    # else return it 
    } else {
      as_tibble(datagroup_subset_of_interest)
    }
  } else {
    # when the datagroups are not found stop here
    if(dim(datagroup_subset_of_interest)[1] == 0){
      stop("None of the datagroups you requested does not exist. Check your IDs")
    } 
    # when only a few have been found return them and warn
    if(dim(datagroup_subset_of_interest)[1] < length(datagroup_id)){
      warning("At least one datagroup you requested does not exist. Check your IDs")
      return(as_tibble(datagroup_subset_of_interest))
    } 
    return(as_tibble(datagroup_subset_of_interest))
  }
}
