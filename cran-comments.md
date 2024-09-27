This is a small release containing the following changes:

# patchDVI 1.11.3

* Work with strict R headers as requested by CRAN.
* Some minor bug fixes.

Please note that it is difficult to build the Japanese.Rnw vignette.  It
requires `uplatex` and `dvipdfmx` for conversion to PDF, and those are not 
commonly installed on non-Japanese machines.  Even if they are installed,
the build may fail because fonts are missing.  With TeXLive, you will
install everything that's needed (and more) using 
```
tlmgr install collection-langjapanese
```
