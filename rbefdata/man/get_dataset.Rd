% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_dataset.R
\name{get_dataset}
\alias{get_dataset}
\title{Fetch datasets from a BEFdata portal}
\usage{
get_dataset(id, split_category = T)
}
\arguments{
\item{id}{Contains the ids of the datasets you want to import.}

\item{split_category}{Determines whether columns with mixed data types are split 
into separate columns. This is handeled from the BEF-Data portal side and
is set to true by default.}
}
\value{
The function returns a data frame or a list of data frames
        containing the data. An error is thrown when the dataset is not found or if
        you don't have the rights to access it.
}
\description{
This function helps you import datasets from a BEFdata portal instance. You
need to provide the function with the database ID of the dataset you want do
download. You can find the ID in the URL of the dataset on the BEFdata
portal. As the import of data requires checking your permissions to access
the data you need to set your user_credentials in the rbefdata options with
bef_options("user_credentials" = "<yourcredentials>". You can find your
credentials in the profile page on the BEFdata portal.
}
\details{
The function returns a data frame or a list of dataframes in case you
provided multiple IDs. Durgin the import each data frame is associated with
its metadata. You can query the information via the attributes() function
which is also shown in the examples below.
}
\examples{
\dontrun{
# get one dataset
data <- rbefdata::get_dataset(id = 8)
# show metadata
meta_data <- attributes(data)
# get multiple datasets
data <- rbefdata::get_dataset(id = c(7,8))
}

}
