The BEFdata R-package
=======================

This R package gives you basic access to the data structures offered by a
[BEFdata](https://github.com/befdata/befdata) portal.


### Install

#### From Cran

If you prefer to install from the Cran package archive you can simply issue the
command below. Cran will always stay up to date with the latest stable version
of RBEFdata.

```
install.packages("rbefdata")
```


#### From Github

You can also install the latest version from Github via the following commands.

```r
# install devtools package if you don't have it.
install.packages("devtools")
# install rbefdata package from github
library(devtools)
install_github("befdata/rbefdata", subdir = "rbefdata")
```

You should be aware that this installation gets you a bleeding edge version
of RBEFdata. It can not be ensured to be in a stable state and you might have
problems running it. If you prefer a stable package you should use the versions
provided over Cran.


### License

RBefdata is released under the MIT License (MIT):

Copyright © 2013 Department of Special Botany, University of Leipzig,
represented by Christian Wirth, The BEF-China Research Unit of the German
Research Foundation (DFG), represented by Helge Bruelheide, as well as Karin
Nadrowski and Sophia Ratcliffe

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
