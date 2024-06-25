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

## Input data

### `tantan`

To load output of `tantan` the simplest at the moment is to convert its
output to BED format and use the `loadTantan()` function. Here is an
exmaple on how to produce the BED file.

    tantan -w 10 -f4 example.fasta | tee example.tantan.txt | awk 'OFS="\t" {print $1, $2, $3, $6, $5, "."}'  > example.tantan.bed

### Other tandem repeat finder softwares

Not supported yet. Patches welcome!

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library("changchang") |> suppressPackageStartupMessages()
loadTantan(system.file('extdata/example.bed.xz', package="changchang"))
#> GRanges object with 1000 ranges and 3 metadata columns:
#>            seqnames          ranges strand |     score
#>               <Rle>       <IRanges>  <Rle> | <numeric>
#>      [1] 1086a8205b           1-613      + | 102.66700
#>      [2] 1086a8205b         645-767      + |   3.42857
#>      [3] 1086a8205b        766-6420      + | 106.67900
#>      [4] 1086a8205b       7381-7473      + |   2.26829
#>      [5] 1086a8205b       8178-8206      - |   2.23077
#>      ...        ...             ...    ... .       ...
#>    [996] 1086a8205b 1706037-1706047      - |   5.50000
#>    [997] 1086a8205b 1706066-1706079      - |   2.80000
#>    [998] 1086a8205b 1706963-1706986      + |   3.25000
#>    [999] 1086a8205b 1707022-1707042      + |   4.20000
#>   [1000] 1086a8205b 1707081-1707106      + |   2.16667
#>                                                     normTandem     nchar
#>                                                       <factor> <integer>
#>      [1] AACCCT                                                        6
#>      [2] AACCCTAACCCTAACCCTAACCCTAACCCTAACCT                          35
#>      [3] AAACCTAGCGACAACACAGGGAGAACACTCTCACCTTAACAAGAACCCTTATT        53
#>      [4] AAAATTTTGCGCGGTTGCGGGCGGGCGCGGGGGCCGATTCC                    41
#>      [5] ACGGGCGGGGGCC                                                13
#>      ...                                                   ...       ...
#>    [996]                                          CG                   2
#>    [997]                                          AAAAC                5
#>    [998]                                          ACTAGCC              7
#>    [999]                                          AGCCT                5
#>   [1000]                                          AAAAAACTAGCC        12
#>   -------
#>   seqinfo: 1 sequence from an unspecified genome; no seqlengths
```

``` r
telomeres(exampleTantan, narrow="ends")
#> GRanges object with 1 range and 5 metadata columns:
#>         seqnames    ranges strand |     score normTandem     nchar    rstart
#>            <Rle> <IRanges>  <Rle> | <numeric>   <factor> <integer> <numeric>
#>   [1] 1086a8205b     1-613      + |   102.667     AACCCT         6   2232853
#>            rend
#>       <numeric>
#>   [1]   2233465
#>   -------
#>   seqinfo: 1 sequence from example genome
```

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
