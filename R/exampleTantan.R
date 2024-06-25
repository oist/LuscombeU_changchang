#' Example tantan data
#'
#' Example object loaded from the output of the `tantan -f4` program after
#' reordering and filterning columns with
#' `awk 'OFS="\t" {print $1, $2, $3, $6, $5, "."}`
#'
#' @format A [`GenomicRanges::GRanges`] object.
#'
#' @author Charles Plessy
#'
"exampleTantan"
