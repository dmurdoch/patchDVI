\name{renderPDF}
\alias{renderMiktex}
\alias{renderPDFMiktex}
\alias{renderDVI}
\alias{renderPDF}
\alias{renderDVIPDFM}
\title{Render R Markdown and Patch}
\description{
These are simple scripts to render, then run LaTeX, then patch.
}
\usage{

renderMiktex(Rmd, main,
    weave = rmarkdown::render,
    ...)

renderPDFMiktex(Rmd, main,
    weave = rmarkdown::render,
    ...)

renderDVI(Rmd, main,
    weave = rmarkdown::render,
    ...)

renderPDF(Rmd, main,
    weave = rmarkdown::render,
    ...)

renderDVIPDFM(Rmd, main,
    weave = rmarkdown::render,
    ...)
}
\arguments{
  \item{Rmd}{ The .Rmd input file }
  \item{main}{ The .tex file on which to run latex, defaulting to the output file from Sweave }
  \item{weave}{ The function to carry out the weaving. }
  \item{...}{ See Details below.}
}
\details{
The \code{...} arguments are passed to the corresponding \code{\link[=SweavePDF]{Sweave*}} function.

If the \code{Rmd} argument is a filename ending in \file{.tex}, then
knitting is skipped, but the output file is still patched (because
one of the other files in the project might have come from R Markdown).

}

\value{
These functions are run for the side effects.
}

\examples{
\dontrun{
renderPDF("chapter.Rnw", "book.tex")
}
}
\keyword{ utilities }
