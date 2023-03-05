test_rmarkdown <- function() {
  if (!requireNamespace("knitr", quietly = TRUE))
    stop("RmdConcord requires knitr to process R Markdown")
  save <- knitr::opts_knit$get(c("concordance", "rmarkdown.pandoc.to"))
  knitr::opts_knit$set(concordance = TRUE, rmarkdown.pandoc.to = "markdown")
  on.exit(knitr::opts_knit$set(save))

  if (!exists("matchConcordance", where = parent.env(environment())))
    stop("RmdConcord requires the backports package containing matchConcordance()")

  if (!requireNamespace("rmarkdown", quietly = TRUE))
    stop("patchDVI requires rmarkdown to process R Markdown documents")
}

pdf_with_patches <- function(driver) {
  driver <- pdf_with_concordance(driver)

  function(latex_engine = "pdflatex",
           sourcepos = TRUE,
           defineSconcordance = TRUE,
           run_latex = TRUE, ...) {

    force(run_latex)

    res <- driver(latex_engine = latex_engine, sourcepos = sourcepos, ...)
    if (sourcepos) {
      # Replace the old post_processor with ours
      oldpost <- res$post_processor
      res$post_processor <- function(yaml, infile, outfile, ...) {
        # Run the RmcConcord postprocessor
        if (is.function(oldpost))
          outfile <- oldpost(yaml, infile, outfile, ...)
        workdir <- dirname(outfile)
        # We should have a concordance file
        concordanceFile <- paste0(sans_ext(normalizePath(infile)), "-concordance.tex")
        origdir <- setwd(workdir)
        on.exit(setwd(origdir))

        newoutfile <- outfile
        orig_ext <- res$pandoc$orig_ext
        if (run_latex &&
            (length(orig_ext) != 1 || orig_ext != ".tex")) {
          # Run pdflatex or other with Synctex output
          consoleLog <- try(texi2dvi(outfile, pdf = TRUE))
          if (!inherits(consoleLog, "try-error")) {
            tempLog <- tempfile(fileext = ".log")
            writeLines(consoleLog, tempLog)
            patchLog(tempLog)
            consoleLog <- readLines(tempLog)
          }
          cat(consoleLog, sep = "\n")
          # Apply concordance changes to Synctex file
          message(patchSynctex(sub("\\.tex$", ".synctex", outfile, ignore.case=TRUE), patchLog = TRUE))
          newoutfile <- paste0(sans_ext(outfile), ".pdf")
        }

        # Run the old post-processor, if there was one

        if (is.function(res$orig_post_processor))
          res <- res$orig_post_processor(yaml, infile, newoutfile, ...)
        else
          res <- newoutfile
        res
      }
    }
    res
  }
}

pdf_documentC <- pdf_with_patches(rmarkdown::pdf_document)
