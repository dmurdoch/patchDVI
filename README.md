
<!-- README.md is generated from README.Rmd. Please edit that file -->

# patchDVI

<!-- badges: start -->
<!-- badges: end -->

The goal of patchDVI is to support previewer forward and reverse search
between Sweave, knitr or R Markdown source and .dvi, .pdf or .html
output.

This project was originally hosted on R-forge; see

<https://r-forge.r-project.org/projects/sweavesearch/>

for the older history.

## Installation

This version of `patchDVI` makes use of some functions that will be
released in R 4.3.0. They are available in a development version of the
`backports` package.

It also requires patches to `knitr` to support concordances in R
Markdown files. These are also currently in a development version of
that package.

You can install the development version of `patchDVI` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("dmurdoch/backports")
devtools::install_github("dmurdoch/knitr")
devtools::install_github("dmurdoch/patchDVI@RmdConcord")
```

## Usage

See the `patchDVI` vignette for usage details and history.
