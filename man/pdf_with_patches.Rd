\name{pdf_with_patches}
\alias{pdf_with_patches}
\title{
Convert an R Markdown pdf driver to one that handles concordances.
}
\description{
This function produces a new driver which matches the old
one in most respects, but adds an argument \code{sourcepos}
(and possibly others).
If that argument is \code{TRUE} (the default) then concordances
are handled by the new driver.

This is used to produce \code{\link{pdf_documentC}}
in this package, and should also work on other drivers that produce
PDF output using Pandoc.
}
\usage{
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
\details{
This function makes use of the \code{RmdConcord::\link[RmdConcord]{pdf_with_concordance}}
function.  That function adds concordances
to the output of the original driver; this function patches the PDF file so that
source references in it refer to the original
source file.
}
\examples{
pdf_with_patches(rmarkdown::latex_fragment)
}
