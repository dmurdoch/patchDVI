
<!-- README.md is generated from README.Rmd. Please edit that file -->

# patchDVI

<!-- badges: start -->
<!-- badges: end -->

The main goal of patchDVI is to support previewer forward and reverse
search between Sweave, knitr or R Markdown source and .dvi, .pdf or
.html output.

It also contains project management functions, to make it more
convenient to build large documents from multiple source files, and
supports editing of Sweave, knitr or R Markdown source in
[TeXworks](https://tug.org/texworks/),
[TeXShop](https://pages.uoregon.edu/koch/texshop/) and other editors.

This project was originally hosted on R-forge; see

<https://r-forge.r-project.org/projects/sweavesearch/>

for older versions.

## Installation

This version of `patchDVI` optionally makes use of `RmdConcord`, a
function to support concordances in R Markdown documents. That package
is not yet on CRAN, but will be installed automatically on your system
if you install the development version of `patchDVI`. You can install
that from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("dmurdoch/patchDVI", dependencies = TRUE)
```

## Usage

See the [`patchDVI`
vignette](https://dmurdoch.github.io/patchDVI/articles/patchDVI.html)
for usage details.
