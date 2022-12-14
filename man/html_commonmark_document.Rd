\name{document_with_concordance}
\alias{html_documentC}
\alias{html_vignetteC}
\alias{pdf_documentC}
\title{
R Markdown drivers to add concordance
}
\description{
These drivers replace the like-named \pkg{rmarkdown}
drivers with ones that output Commonmark rather than Pandoc Markdown.
Commonmark is a dialect of Markdown.  The Pandoc driver
for Commonmark supports output of source position information.
By using this function as your output driver, you can get that
in your own documents.
}
\usage{
html_documentC(sourcepos = TRUE, ...)
html_vignetteC(sourcepos = TRUE, ...)
pdf_documentC(latex_engine = "pdflatex",
           sourcepos = TRUE,
           defineSconcordance = TRUE,
           run_latex = TRUE, ...)
}
\arguments{
  \item{sourcepos}{
Whether to include source position information.
}
  \item{latex_engine}{
Command to convert \file{.tex} file to \file{.pdf}.
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
Each driver modifies the standard \pkg{rmarkdown} driver, e.g.
\code{patchDVI::html_documentC} is similar to
\code{\link[rmarkdown]{html_document}}, but uses Commonmark
and adds concordances.
}
\value{
An R Markdown output format object which will add concordance
information.
}
\author{
Duncan Murdoch
}
