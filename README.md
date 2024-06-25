ChangChang manual
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

# changchang

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Bioc release
status](http://www.bioconductor.org/shields/build/release/bioc/changchang.svg)](https://bioconductor.org/checkResults/release/bioc-LATEST/changchang)
[![Bioc devel
status](http://www.bioconductor.org/shields/build/devel/bioc/changchang.svg)](https://bioconductor.org/checkResults/devel/bioc-LATEST/changchang)
[![Bioc downloads
rank](https://bioconductor.org/shields/downloads/release/changchang.svg)](http://bioconductor.org/packages/stats/bioc/changchang/)
[![Bioc
support](https://bioconductor.org/shields/posts/changchang.svg)](https://support.bioconductor.org/tag/changchang)
[![Bioc
history](https://bioconductor.org/shields/years-in-bioc/changchang.svg)](https://bioconductor.org/packages/release/bioc/html/changchang.html#since)
[![Bioc last
commit](https://bioconductor.org/shields/lastcommit/devel/bioc/changchang.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/changchang/)
[![Bioc
dependencies](https://bioconductor.org/shields/dependencies/release/changchang.svg)](https://bioconductor.org/packages/release/bioc/html/changchang.html#since)
<!-- badges: end -->

The goal of `changchang` is to …

## Installation instructions

Get the latest stable `R` release from
[CRAN](http://cran.r-project.org/). Then install `changchang` from
[Bioconductor](http://bioconductor.org/) using the following code:

``` r
if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}

BiocManager::install("changchang")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library("changchang")
#> Loading required package: GenomicRanges
#> Loading required package: stats4
#> Loading required package: BiocGenerics
#> 
#> Attaching package: 'BiocGenerics'
#> The following objects are masked from 'package:stats':
#> 
#>     IQR, mad, sd, var, xtabs
#> The following objects are masked from 'package:base':
#> 
#>     anyDuplicated, aperm, append, as.data.frame, basename, cbind,
#>     colnames, dirname, do.call, duplicated, eval, evalq, Filter, Find,
#>     get, grep, grepl, intersect, is.unsorted, lapply, Map, mapply,
#>     match, mget, order, paste, pmax, pmax.int, pmin, pmin.int,
#>     Position, rank, rbind, Reduce, rownames, sapply, setdiff, table,
#>     tapply, union, unique, unsplit, which.max, which.min
#> Loading required package: S4Vectors
#> 
#> Attaching package: 'S4Vectors'
#> The following object is masked from 'package:utils':
#> 
#>     findMatches
#> The following objects are masked from 'package:base':
#> 
#>     expand.grid, I, unname
#> Loading required package: IRanges
#> Loading required package: GenomeInfoDb
```

``` r
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub!

## Citation

Below is the citation output from using `citation('changchang')` in R.
Please run this yourself to check for any updates on how to cite
**changchang**.

``` r
print(citation('changchang'), bibtex = TRUE)
#> To cite package 'changchang' in publications use:
#> 
#>   Plessy C (2024). _ChangChang_. doi:10.18129/B9.bioc.changchang
#>   <https://doi.org/10.18129/B9.bioc.changchang>,
#>   https://github.com//changchang - R package version 0.99.0,
#>   <http://www.bioconductor.org/packages/changchang>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {ChangChang},
#>     author = {Charles Plessy},
#>     year = {2024},
#>     url = {http://www.bioconductor.org/packages/changchang},
#>     note = {https://github.com//changchang - R package version 0.99.0},
#>     doi = {10.18129/B9.bioc.changchang},
#>   }
#> 
#>   Plessy C (2024). "ChangChang." _bioRxiv_. doi:10.1101/TODO
#>   <https://doi.org/10.1101/TODO>,
#>   <https://www.biorxiv.org/content/10.1101/TODO>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Article{,
#>     title = {ChangChang},
#>     author = {Charles Plessy},
#>     year = {2024},
#>     journal = {bioRxiv},
#>     doi = {10.1101/TODO},
#>     url = {https://www.biorxiv.org/content/10.1101/TODO},
#>   }
```

Please note that the `changchang` was only made possible thanks to many
other R and bioinformatics software authors, which are cited either in
the vignettes and/or the paper(s) describing this package.

## Code of Conduct

Please note that the `changchang` project is released with a
[Contributor Code of
Conduct](http://bioconductor.org/about/code-of-conduct/). By
contributing to this project, you agree to abide by its terms.

## Development tools

- Continuous code testing is possible thanks to [GitHub
  actions](https://www.tidyverse.org/blog/2020/04/usethis-1-6-0/)
  through *[usethis](https://CRAN.R-project.org/package=usethis)*,
  *[remotes](https://CRAN.R-project.org/package=remotes)*, and
  *[rcmdcheck](https://CRAN.R-project.org/package=rcmdcheck)* customized
  to use [Bioconductor’s docker
  containers](https://www.bioconductor.org/help/docker/) and
  *[BiocCheck](https://bioconductor.org/packages/3.19/BiocCheck)*.
- Code coverage assessment is possible thanks to
  [codecov](https://codecov.io/gh) and
  *[covr](https://CRAN.R-project.org/package=covr)*.
- The code is styled automatically thanks to
  *[styler](https://CRAN.R-project.org/package=styler)*.
- The documentation is formatted thanks to
  *[devtools](https://CRAN.R-project.org/package=devtools)* and
  *[roxygen2](https://CRAN.R-project.org/package=roxygen2)*.

For more details, check the `dev` directory.

This package was developed using
*[biocthis](https://bioconductor.org/packages/3.19/biocthis)*.
