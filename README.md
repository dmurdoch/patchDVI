
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
package to support concordances in R Markdown documents. You can install
the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("dmurdoch/patchDVI", dependencies = TRUE)
```

The CRAN version is installed with

``` r
install.packages("patchDVI", dependencies = TRUE)
```

## Usage

See the [`patchDVI`
vignette](https://dmurdoch.github.io/patchDVI/articles/patchDVI.html)
for usage details.
