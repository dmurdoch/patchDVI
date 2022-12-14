\name{processConcordance}
\alias{processConcordance}
\title{
Get the concordance from the datapos values and record it in
a file.
}
\description{
Pandoc can record concordance information in datapos attributes
when converting Commonmark documents to HTML.  This retrieves
that information, and rewrites it as standard R concordance
data.
}
\usage{
processConcordance(filename, newfilename = filename,
                      rename = NULL,
                      followConcordance = TRUE)
}
\arguments{
  \item{filename}{
The filename of the HTML file produced by Pandoc.
}
  \item{newfilename}{
A filename in which to write the changed data.
}
  \item{rename}{
A named character vector.  Names are the names in the \code{datapos}
attributes; values are the names that should be included in the
concordance instead. This might be used since \pkg{knitr} produces a
Markdown file and renames it later.
  }
  \item{followConcordance}{
If \code{filename} already contains concordance data, assume
that the Rmd file was produced automatically, and chain the
concordances.
}
}
\value{
Called for the side effect of rewriting the concordance, it returns
\code{newfilename} invisibly.
}
\author{
Duncan Murdoch
}
\examples{
# This example works on the file inst/sample/Sample.Rmd,
# which should be a copy of the vignette Sample.Rmd.  This
# is convenient because RStudio doesn't install vignettes by default.

# First, see the results without concordances:

library(patchDVI)
dir <- tempdir()
infile <- system.file("sample/Sample.Rmd", package = "patchDVI")
outfile1 <- file.path(dir, "html_vignette.html")
rmarkdown::render(infile,
                  output_file = outfile1,
                  quiet = TRUE)
tools:::tidy_validate(outfile1)

# Next, see them with concordances by setting
# the output format to use patchDVI::html_documentC
# which post-processes the document with processConcordance.
# Note that this requires patches to `knitr`, which can be
# obtained using
#   install_github("dmurdoch/knitr")

dir <- tempdir()
outfile2 <- file.path(dir, "commonmark.html")
rmarkdown::render(infile,
                  output_file = outfile2,
                  output_format = patchDVI::html_documentC(),
                  quiet = TRUE)
patchDVI:::tidy_validate(outfile2)
}
