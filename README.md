The BEFdata R-package
=======================

The companion R package for the collaborative web-based data management
software [BEFdata](https://github.com/cpfaff/befdata). The package provides you
with easy access to your data and the associated metadata. Besides that it to
helps you to pull your datasets from the server into your analysis workflow it
allows to upload derived results including the analysis script itself to help
you document your work in a reproducible fashion.

Further more the package implements scientometric metrics providing valuable
information about your data (e.g. usage, networking) and the project itself.
This allows you to better understand the project, its dynamics and the progress
over time to help identify potential opportunities for future collaborations
and much more.

### Install

#### From CRAN

The package is available from CRAN. To install it from there simply issue the
command shown below. CRAN will always stay up to date with the latest stable
version of RBEFdata.

```
install.packages("rbefdata")
```

#### From GitHub

With the `devtools` package you the option to install the latest version from
my GitHub repository. For that you have to issue the commands below.

```r
# install devtools package
install.packages("devtools")
# install rbefdata from github
library(devtools)
install_github("befdata/rbefdata", subdir = "rbefdata")
```

However, you should be aware that this gets you a bleeding edge version of
rBEFdata. It might fail to install or it can happen that certain functions are
not working as expected. If you prefer a stable and tested package you should
use the versions provided via CRAN.

### License

rBefdata is released under the MIT License (MIT):

Copyright © 2013 Department of Special Botany, University of Leipzig,
represented by Christian Wirth, The BEF-China Research Unit of the German
Research Foundation (DFG), represented by Helge Bruelheide, as well as Karin
Nadrowski and Sophia Ratcliffe

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the “Software”), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
