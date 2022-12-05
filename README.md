
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
devtools::install_github("dmurdoch/patchDVI")
```

## Usage

See the [`patchDVI`
vignette](https://dmurdoch.github.io/patchDVI/articles/patchDVI.html)
for usage details and history.
