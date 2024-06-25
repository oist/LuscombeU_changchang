#' Load tantan results
#'
#' Load the output of `tantan -f4 awk 'OFS="\t" {print $1, $2, $3, $6, $5, "."}`.
#'
#' @param file The output file to load
#'
#' @return A [`GenomicRanges::GRanges`] object.
#'
#' @importFrom GenomicRanges score strand strand<-
#' @importFrom rtracklayer import.bed
#' @export

load_tantan <- function(file) {
  # Load BED file
  gr <- rtracklayer::import.bed(file)
  # normalise tandem sequences
  forward <- as.character(.tandemNormalForm_onestrand(gr$name))
  reverse <- as.character(.tandemNormalForm_onestrand(Biostrings::reverseComplement(Biostrings::DNAStringSet(gr$name))))
  strand(gr) <-  ifelse(forward < reverse, "+", "-")
  gr$normTandem <- ifelse(strand(gr) == '+', forward, reverse) |> factor()
  # Record tandem unit length
  gr$nchar <- nchar(as.character(gr$normTandem))
  # Remove temporary columns
  gr$name <- NULL
  # Return genomic ranges
  gr
}
