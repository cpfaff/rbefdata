#' Push data to a BEFdata portal from R via the R BEFdata package
#' 
#' This function enables you to upload updated data and meta data 
#' to a BEFdata portal. 
#' 
#' @param dummy is just a dummy parameter for the function this file 
#'        will be filled later. 
#' 
#' @return It will return a message if the data was successfully pushed to 
#'         the server. 
#'
#' @examples \dontrun{
#'  message=bef.pushdata()
#' }
#' 
#' @import RCurl
#' @export 

bef.pushdata <- function(dummy="Test data pushed") {
  return(dummy)
}