#' Tematres API via rtematres
#'
#' This function queries a tematres thesaurus server using the rtematres
#' api package. It provides access to descriptions and relations of terms
#' in form of broader, narrower or related terms.
#'
#' @param ... Any task or term to be passed to the rtematres function.
#' 	      An example is rtematres(task = "fetchUp", term = "plant organ")
#'            to get broader terms for "plant organs". For a full task
#'	      see the manual of the rtematres package.
#'
#' @import rtematres
#' @export bef.tematres

bef.tematres <- function(...) {
      rtematres(...)
}
