\name{knitPDF}
\alias{knitMiktex}
\alias{knitPDFMiktex}
\alias{knitDVI}
\alias{knitPDF}
\alias{knitDVIPDFM}
\title{Knit a File and Patch}
\description{
This is a simple script to run knit, then LaTeX, then patchDVI.
}
\usage{
knitMiktex(Rnw, main,
    weave = knitr::knit,
    ...)

knitPDFMiktex(Rnw, main,
    weave = knitr::knit,
    ...)

knitDVI(Rnw, main,
    weave = knitr::knit,
    ...)

knitPDF(Rnw, main,
    weave = knitr::knit,
    ...)

knitDVIPDFM(Rnw, main,
    weave = knitr::knit,
    ...)
}
\arguments{
  \item{Rnw}{ The .Rnw input file }
  \item{main}{ The .tex file on which to run latex, defaulting to the output file from Sweave }
  \item{weave}{ The function to carry out the weaving. }
  \item{...}{ See Details below.}
}
\details{
The \code{...} arguments are passed to the corresponding \code{\link[=SweavePDF]{Sweave*}} function.

If the \code{Rnw} argument is a filename ending in \file{.tex}, then
knitting is skipped, but the output file is still patched (because
one of the other files in the project might have come from knitr).
}

\value{
These functions are run for the side effects.
}

\examples{
\dontrun{
knitPDF("chapter.Rnw", "book.tex")
}
}
\keyword{ utilities }
