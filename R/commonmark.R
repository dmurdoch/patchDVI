test_rmarkdown <- function() {
  if (!requireNamespace("knitr", quietly = TRUE))
    stop("patchDVI requires knitr to process R Markdown")
  save <- knitr::opts_knit$get(c("concordance", "rmarkdown.pandoc.to"))
  knitr::opts_knit$set(concordance = TRUE, rmarkdown.pandoc.to = "markdown")
  on.exit(knitr::opts_knit$set(save))
  if (!knitr:::concord_mode())
    stop("patchDVI requires patches to knitr that are available using\n  remotes::install_github('dmurdoch/knitr')")

  if (!exists("matchConcordance", where = parent.env(environment())))
    stop("patchDVI requires the backports package containing matchConcordance()")

  if (!requireNamespace("rmarkdown", quietly = TRUE))
    stop("patchDVI requires rmarkdown to process R Markdown documents")
}

fix_pandoc_from_options <- function(from, sourcepos) {
  from <- sub("^markdown", "commonmark_x", from)
  from <- sub("[+]tex_math_single_backslash", "", from)
  from <- paste0(from,
                 "+yaml_metadata_block",
                 if (sourcepos) "+sourcepos")
  from
}

html_with_concordance <- function(driver) {
  force(driver)
  function(sourcepos = TRUE, ...) {
    # Have we got the suggested dependencies?
    test_rmarkdown()

    res <- driver(...)
    res$knitr$opts_knit$concordance <- sourcepos
    if (sourcepos) {
      res$knitr$opts_knit$out_format <- "markdown"

      oldpost <- res$post_processor
      res$post_processor <- function(...) {
        res <- oldpost(...)
        processConcordance(res, res)
        res
      }

      res$pandoc$from <- fix_pandoc_from_options(res$pandoc$from, sourcepos)
    }
    res
  }
}

html_documentC <- html_with_concordance(rmarkdown::html_document)

html_vignetteC <- html_with_concordance(rmarkdown::html_vignette)

pdf_with_concordance <- function(driver) {
  force(driver)
  function(latex_engine = "pdflatex",
           sourcepos = TRUE,
           defineSconcordance = TRUE,
           run_latex = TRUE, ...) {

    # Have we got the suggested dependencies?
    test_rmarkdown()

    force(run_latex)

    res <- driver(latex_engine = latex_engine, ...)
    res$knitr$opts_knit$concordance <- sourcepos
    if (sourcepos) {
      res$pandoc$from <- fix_pandoc_from_options(res$pandoc$from, sourcepos)
# res$pandoc$to <- "native"
      # Add filter to insert \datapos markup
      res$pandoc$lua_filters <- c(res$pandoc$lua_filters,
                                  system.file("rmarkdown/lua/pagebreak.lua", package = "patchDVI"),
                                  system.file("rmarkdown/lua/latex-datapos.lua", package = "patchDVI")
                                  )
      # Pandoc should produce .tex, not go directly to .pdf
      orig_ext <- res$pandoc$ext
      res$pandoc$ext = ".tex"

      # Replace the old post_processor with ours
      oldpost <- res$post_processor
      res$post_processor <- function(yaml, infile, outfile, ...) {
        workdir <- dirname(outfile)
        # We should have a concordance file
        concordanceFile <- paste0(sans_ext(normalizePath(infile)), "-concordance.tex")
        origdir <- setwd(workdir)
        on.exit(setwd(origdir))
        # Modify the .tex file
        processLatexConcordance(outfile, followConcordance = concordanceFile, defineSconcordance = defineSconcordance)

        newoutfile <- outfile
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

        if (is.function(oldpost))
          res <- oldpost(yaml, infile, newoutfile, ...)
        else
          res <- newoutfile
        res
      }
    }
    res
  }
}

pdf_documentC <- pdf_with_concordance(rmarkdown::pdf_document)
