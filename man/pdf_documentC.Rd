\name{pdf_documentC}
\alias{pdf_documentC}
\title{
R Markdown driver to add concordance
}
\description{
The \code{pdf_documentC} driver replaces the like-named \pkg{rmarkdown}
driver with one that outputs Commonmark rather than Pandoc Markdown.
Commonmark is a dialect of Markdown for which the Pandoc driver
for Commonmark supports output of source position information.
By using this function as your output driver, you can get that
in your own documents.
}
\usage{
pdf_documentC(latex_engine = "pdflatex",
           sourcepos = TRUE,
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
This driver modifies the standard \pkg{rmarkdown} driver
\code{\link[rmarkdown]{pdf_document}} to use Commonmark
and add concordances.

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
