The BEFdata R-package
=======================

The companion R package for the collaborative data management platform
[BEFdata](https://github.com/cpfaff/befdata). The package provides you with
easy access to your data and the associated meta to help you pull your
collected and curated datasets into your analysis workflow.

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
