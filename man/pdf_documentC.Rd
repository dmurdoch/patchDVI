\name{pdf_documentC}
\alias{pdf_documentC}
\alias{latex_formatC}
\title{
R Markdown drivers to add concordance
}
\description{
The \code{pdf_documentC} driver replaces the like-named \pkg{rmarkdown}
driver with one that outputs Commonmark rather than Pandoc Markdown.
Commonmark is a dialect of Markdown for which the Pandoc driver
for Commonmark supports output of source position information.  The \code{latex_formatC} does the same
for the \code{markdown::latex_format} driver.
By using one of these functions as your output driver, you can get that
in your own documents.
}
\usage{
pdf_documentC(latex_engine = "pdflatex",
           sourcepos = TRUE,
           defineSconcordance = TRUE,
           run_latex = TRUE, ...)
latex_formatC(latex_engine = "pdflatex",
              options = list(sourcepos = TRUE),
              defineSconcordance = TRUE,
              run_latex = TRUE, ...)
}
\arguments{
  \item{latex_engine}{
Command to convert \file{.tex} file to \file{.pdf}.
}
  \item{sourcepos}{
Whether to include source position information.
}
  \item{options}{
Options to pass to the underlying driver; \code{"sourcepos"} defaults to \code{TRUE}.
  }
  \item{defineSconcordance}{
If \code{TRUE}, insert a definition of the \verb{\Sconcordance}
macro just before \verb{\begin{document}}.
}
  \item{run_latex}{
Whether to run the \code{latex_engine} to produce a PDF.
  }
  \item{\dots}{
Other arguments to pass to the base driver.
}
}
\details{
These drivers modify the standard drivers to
use Commonmark and add concordances.

The \code{latex_formatC} driver requires a currently
unreleased version of the \code{commonmark} package, with
version higher than 1.9.0.
}
\value{
An R Markdown output format object which will add concordance
information.
}
\author{
Duncan Murdoch
}
