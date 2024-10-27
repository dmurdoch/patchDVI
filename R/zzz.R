checkUplatex <- function(tex) {
  # Check for commands
  cmds <- Sys.which(c("uplatex", "dvipdfmx"))
  good <- TRUE
  if (any(nchar(cmds) == 0)) {
    msg <- paste("Missing executable: ", c("uplatex", "dvipdfmx")[nchar(cmds) == 0])
    warning(gettextf("Vignette '%s' requires 'uplatex' and 'dvipdfmx'", basename(tex)))
    good <- FALSE
  } else {
    msg <- system("uplatex --version", intern = TRUE)
    if (grepl("eu-pTeX", msg[1])) {
      warning(gettextf("Vignette '%s' requires Japanese 'uplatex' based on 'pTeX'.", basename(tex)))
      good <- FALSE
    }
  }

  if (!good) {
    lines <- c(
      "\\documentclass{article}
\\begin{document}
    This document requires ``uplatex'' (based on the Japanese pTeX) and ``dvipdfmx''.  MikTeX's ``eu-pTeX'' does not work.

Diagnostics:
\\begin{verbatim}",
      msg,
      "\\end{verbatim}
\\end{document}")
    writeLines(lines, tex)
    return(tex)
  }
}

JSweave <- function(file, weave = utils::Sweave, ...) {
  tex <- sub("[.][RrSs](nw|tex)$", ".tex", file)
  # Check for commands
  check <- checkUplatex(tex)
  if (!is.null(check))
    return(check)

  # Need two runs to make TOC.  Skip dvipdfm on the first run,
  # skip Sweave on the second run
  SweaveDVIPDFM(file, latex = "uplatex", dvipdfm = "echo",
                encoding = "UTF-8", weave = weave)
  SweaveDVIPDFM(tex, latex = "uplatex", dvipdfm = "dvipdfmx",
                encoding = "UTF-8")
}

.onLoad <- function(libname, pkgname) {
  vignetteEngine("JSweave", weave = JSweave, tangle = Stangle)
}

Jknitr <- function(file, ...) {
  if (!requireNamespace("knitr"))
    stop("The Jknitr driver requires the knitr package.")
  JSweave(file = file, weave = knitr::knit)
}

knitr_purl <- function(...) {
  if (!requireNamespace("knitr"))
    stop("The Jknitr driver requires the knitr package.")
  knitr::purl(...)
}

.onLoad <- function(libname, pkgname) {
  vignetteEngine("JSweave", weave = JSweave, tangle = Stangle)
  vignetteEngine("Jknitr", weave = Jknitr, tangle = knitr_purl)
}
