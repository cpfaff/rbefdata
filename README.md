
# The rBEFdata package <img src="assets/images/rbefdata_logo_small.png" align="right" />

rBEFdata is the companion R package to the collaborative web-based data
management software [BEFdata](https://github.com/cpfaff/befdata). The
package provides you with access to data and the metadata on a BEFdata
instance. It helps you to pull your datasets from the server into your
analysis workflow and allows to upload derived results (e.g. datasets,
pictures) to help you document your work in a more transparent and
reproducable fashion.

### Install

#### From CRAN

The package is available from CRAN. To install it from there simply
issue the command shown below. CRAN will always stay up to date with the
latest stable version of RBEFdata.

``` r
install.packages("rbefdata")
```

#### From GitHub

Using the `devtools` package you can install the latest version from
this repository.

  - Install devtools

<!-- end list -->

``` r
install.packages("devtools")
```

  - Install rBEFdata

<!-- end list -->

``` r
library(devtools)
install_github("befdata/rbefdata", subdir = "rbefdata")
```

NOTE:

You should be aware that this gets you a bleeding edge version of
rBEFdata. It might fail to install or it can happen that certain
functions are not working as expected. If you prefer a stable and tested
package you should use the versions provided via CRAN.

### Usage

First load the package. It provides you with a set of options. You can
querry and set these with the `bef_options()` command. You should set
the URL to the server that you want to use.

#### Setup

  - Load the package

<!-- end list -->

``` r
require(rbefdata)
```

  - Show all options

<!-- end list -->

``` r
bef_options()
#> $url
#> [1] ""
#> 
#> $download_dir
#> [1] "downloads"
#> 
#> $user_credentials
#> [1] ""
```

  - Set a URL

<!-- end list -->

``` r
bef_options(url = "https://china.befdata.biow.uni-leipzig.de")
```

  - Set your credentials

NOTE:

You can find these in your profile page on the BEFdata portal.

``` r
bef_options(user_credentials = "<yourcredentials>")
```

  - You are ready

<!-- end list -->

``` r
bef_options()
#> $url
#> [1] "https://china.befdata.biow.uni-leipzig.de"
#> 
#> $download_dir
#> [1] "downloads"
#> 
#> $user_credentials
#> [1] "<yourcredentials>"
```

#### Get data

  - Get single or multiple datasets at once

<!-- end list -->

``` r
get_dataset(id = 16)
get_dataset(id = c(16, 17))
```

  - Get attachments from datasets

<!-- end list -->

``` r
get_dataset_attachment(id = 16)
get_dataset_attachment(id = c(16, 17))
```

  - Get datasets from proposal

<!-- end list -->

``` r
get_proposal_dataset(id = 122)
```

#### Update data

  - Update a datasets with local data

NOTE:

This overwrites a dataset on the portal using a local dataset

``` r
update_dataset(id = 16)
```

### License

rBefdata is released under the MIT License (MIT):

Copyright © 2013 Department of Special Botany, University of Leipzig,
represented by Christian Wirth, The BEF-China Research Unit of the
German Research Foundation (DFG), represented by Helge Bruelheide, as
well as Karin Nadrowski and Sophia Ratcliffe

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
“Software”), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
