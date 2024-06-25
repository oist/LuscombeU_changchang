#' Load tantan results
#'
#' Load the output of `tantan -f4 | awk 'OFS="\t" {print $1, $2, $3, $6, $5, "."}`.
#'
#' If given the genome file that `tantan` used, it will use it to create a
#' `seqinfo` object for the returned `GRanges` object
#'
#' @param file The output file to load
#' @param genome.file Path to the genome file that was given to `tantan`
#' @param genome.name A genome name for the `seqinfo` of the returned `GRanges`
#'
#' @return A [`GenomicRanges::GRanges`] object.
#'
#' @importFrom GenomicRanges score strand strand<-
#' @importFrom rtracklayer import.bed
#' @export
#'
#' @examples
#' loadTantan(system.file('extdata/example.bed.xz', package="changchang"))

loadTantan <- function(file, genome.file=NA, genome.name=NA) {
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
  # Add seqinfo if available
  if (!is.na(genome.file)) {
    seqinfo(gr) <- .make_seq_info(genome.file, genome.name)
  }
  # Return genomic ranges
  gr
}

#' @noRd
#' @importFrom Biostrings readDNAStringSet

.make_seq_info <- function(genome.file, genome.name=NA) {
  genome.obj <- readDNAStringSet(genome.file)
  genome(genome.obj) <- genome.name
  seqinfo(genome.obj)
}
