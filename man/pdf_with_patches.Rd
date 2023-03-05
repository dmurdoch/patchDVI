\name{pdf_with_patches}
\alias{html_with_concordance}
\alias{pdf_with_patches}
\title{
Convert an R Markdown driver to one that handles concordances.
}
\description{
These functions produce a new driver which matches the old
one in most respects, but adds an argument \code{sourcepos}
(and possibly others).
If that argument is \code{TRUE} (the default) then concordances
are handled by the new driver.

These functions are used to produce \code{\link{pdf_documentC}} and \code{\link{html_documentC}}
in this package, and should also work on other drivers that produce
HTML or PDF output using Pandoc.
}
\usage{
html_with_concordance(driver)
pdf_with_patches(driver)
}
\arguments{
  \item{driver}{
An R Markdown driver that produces HTML, LaTeX or PDF using Pandoc.
}
}
\value{
A new driver function.
}
\examples{
html_with_concordance(rmarkdown::html_fragment)
pdf_with_patches(rmarkdown::latex_fragment)
}
