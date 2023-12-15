test_packages <- function(pandoc = TRUE) {

  if (!requireNamespace("RmdConcord")) {
    warning("The RmdConcord package is required")
    return(FALSE)
  }
  if (!RmdConcord::test_packages(FALSE, pandoc = pandoc))
    return(FALSE)

  TRUE
}

pdf_with_patches <- function(driver) {

  if (!test_packages()) return(driver)

  driver <- RmdConcord::pdf_with_concordance(driver)

  function(latex_engine = "pdflatex",
           sourcepos = TRUE,
           defineSconcordance = TRUE,
           run_latex = TRUE, ...) {

    force(run_latex)

    res <- driver(latex_engine = latex_engine, sourcepos = sourcepos, ...)

    res <- apply_patches(res, sourcepos, defineSconcordance, run_latex)
  }
}

apply_patches <- function(res, sourcepos, defineSconcordance, run_latex) {
    if (sourcepos) {
      # Replace the old post_processor with ours
      oldpost <- res$post_processor
      res$post_processor <- function(yaml, infile, outfile, ...) {
        # Run the RmdConcord postprocessor
        if (is.function(oldpost))
          outfile <- oldpost(yaml, infile, outfile, ...)
        workdir <- dirname(outfile)
        # We should have a concordance file
        concordanceFile <- paste0(sans_ext(normalizePath(infile)), "-concordance.tex")
        origdir <- setwd(workdir)
        on.exit(setwd(origdir))

        newoutfile <- outfile
        orig_ext <- res$pandoc$RmdConcord_ext
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

        if (is.function(res$RmdConcord_post_processor))
          res <- res$RmdConcord_post_processor(yaml, infile, newoutfile, ...)
        else
          res <- newoutfile
        res
      }
    }
    res
}

pdf_documentC <- pdf_with_patches(rmarkdown::pdf_document)

latex_formatC <- function(latex_engine = "pdflatex",
                          options = list(sourcepos = TRUE),
                          defineSconcordance = TRUE,
                          run_latex = TRUE,
                          ...) {
  if (!test_packages(pandoc = FALSE))
    if (requireNamespace("markdown"))
      return(markdown::latex_format(latex_engine = latex_engine, options = options, ...))
    else
      stop("The 'markdown' package is needed")

  force(latex_engine)
  force(defineSconcordance)
  force(run_latex)

  sourcepos <- options$sourcepos
  if (is.null(sourcepos))
    options$sourcepos <- sourcepos <- NULL

  res <- RmdConcord::latex_formatC0(latex_engine = latex_engine,
                                    options = options,
                                    ...)
  apply_patches(res, sourcepos, defineSconcordance = defineSconcordance, run_latex = run_latex)
}
