# patchDVI 0.1 to 0.4

Quick initial releases.

# patchDVI 0.5

* Fixes bug in handling of named chunks.
* Changes (and shrinks) format of inserted special.

# patchDVI 0.6

* Removed concordance during patching, to avoid Miktex bug.

# patchDVI 0.7

* Removed limitation on changing the size of a special.

# patchDVI 0.8

* Allowed specials to be removed by setting their value to NA in setDVIspecials.

# patchDVI 0.9

* Add `expand=FALSE` option.

# patchDVI 1.0

* Move `Sweave()` changes into R-devel, delete them from `patchDVI`

# patchDVI 1.1

* Allow it to run `pdflatex` (just to set the include directory)

# patchDVI 1.2

* Case-insensitive filename matching.
* ChangeLog renamed to NEWS.
* Updated memory management to 2.6.x scheme.

# patchDVI 1.3

* Use `texify` instead of latex/pdflatex in `SweaveMiktex()`/`SweavePDFMiktex()`
* Use `normalizePath()` so that path comparisons are more reliable.

# patchDVI 1.4

* Add experimental patching of SyncTex output.
* Allow options to be specified on the command line.

# patchDVI 1.5

* Add `stylepath` and `...` args to `SweaveMiktex()` for more flexibility.
* Add `BugReports` field to `DESCRIPTION`.

# patchDVI 1.6

* Add `source.code` arg to `SweaveMiktex()` and `SweavePDFMiktex()`
to allow experimental versions of `Sweave()` to be used.

# patchDVI 1.7

* Add `SweaveAll()`, `SweavePDF()`, `SweaveDVI()`, as well as
handling `.PostSweaveHook`, `.SweaveFiles` and `.TexRoot` (see `SweaveAll()`).
* Added modified version of `tools::texi2dvi()`.  Added vignette.
* Added preview option to `Sweave*` functions.
* Fixed bugs in patchDVI:  no message printed, missed
`.tex` files that were included by `\input{filename}`.

# patchDVI 1.8.1583

* Made an attempt to handle compressed PDF files by using
`pdftk` to uncompress them.
* Fixed bug in concordance inclusion into PDF files in `Sweave()`;
adapted code here to handle it (for R > 2.12.2).
* Added `grepConcords()` method (using new `grepRaw()` function).
* Texworks on Windows needs Unix line endings on the Synctex
file; we now produce those on all platforms.
* Fixed crash on file with no concordance.
* Missing `.tex` files were not being built by `SweaveAll()`.
* Updated to handle new concordance format in R-devel (2.14.0-to-be).
* Added `.SweaveMake` variable to override the `make` arg to `SweaveAll()`.

# patchDVI 1.8.1584

* In `SweavePDF()` and `SweaveDVI()`, wrapped `texi2dvi()` call in
`try()` in case of bad return status.

# patchDVI 1.8.1585

* Added quick start instructions, and editor instructions.

# patchDVI 1.9

* Cleaned up for CRAN release.

# patchDVI 1.9.1594

* Added `SweaveDVIPDFM()` to allow users to use `latex`/`dvipdfm`
rather than `pdflatex`.
* Updated the TeXShop and TeXWorks instructions.
* Added vignette for Japanese language work.
* Added `patchLog()` function to patch messages in log files.
* Added `patchLog` option to the `Sweave*` functions to call
`patchLog()`.
* Added `sleep` parameter to the Miktex `Sweave*` functions.

# patchDVI 1.9.1616

* Modified `SweaveAll()` and `patchSynctex()` to allow non-Sweave
vignette support (aimed at knitr).
* Added `useknitr()` and `defSconcordance()` functions for the same aim.
* Improved Japanese language support, and updated the
`Japanese.Rnw` vignette with the help of Prof. Haruhiko Okumura.

# patchDVI 1.9.1619

* Imported `file_test()` to avoid warning.
* Quotes in DESCRIPTION.
* Better error message when building Japanese vignette.

# patchDVI 1.9.1620

* `SweaveAll()` now has a `force = TRUE` argument, to
allow it to do staleness checking from the beginning.
It also has a `verbose = FALSE` argument for debugging.

# patchDVI 1.9.1621

* Added more support for RStudio, including `knitInRStudio()`.

# patchDVI 1.10.1

* Added `needsPackages()` function.

# patchDVI 1.11.0

* Added support for R Markdown sources using R Markdown
output driver `pdf_documentC()` and the new `RmdConcord`
package.
* Moved source to Github, added website
https://dmurdoch.github.io/patchDVI/ .

# patchDVI 1.11.3

* Modified code to work with strict R headers.
* Cleaned up error handling in case of LaTeX issues (particularly with
missing Japanese support).

# patchDVI 1.11.4

* Added code to detect defective MikTeX installation of
`uplatex`, needed for Japanese support.
