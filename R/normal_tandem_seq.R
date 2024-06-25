#' Normal form of tandem sequence
#'
#' Computes the lexicographically smallest rotation of a tandem repeat base
#' unit.
#'
#' @param seq tandem repeat base unit sequence
#' @param strand With strand to consider
#'
#' @return Returns normal forms of the tandem unit sequences, in the same class
#' as the input.
#'
#' @author Charles Plessy
#'
#' @importFrom Biostrings DNAStringSet reverseComplement
#' @export
#'
#' @examples
#' telomeres <- c("TAAGGG", "CCCTTA")
#' tandemNormalForm(telomeres)
#' tandemNormalForm(telomeres, strand="reverse")
#' tandemNormalForm(telomeres, strand="both")
#' tandemNormalForm(factor(telomeres), strand="both") # Should return a factor
#' tandemNormalForm(Biostrings::DNAStringSet(telomeres), strand="both") # Should return a DNAStringSet
#'

setGeneric("tandemNormalForm",
  function(seq, strand=c("forward", "reverse", "both")) {
    strand <- match.arg(strand)
    standardGeneric("tandemNormalForm")
})

#' @rdname tandemNormalForm
#' @export

setMethod("tandemNormalForm", "character", function(seq, strand) {
  as.character(.tandemNormalForm(seq, strand))
})

#' @rdname tandemNormalForm
#' @export

setMethod("tandemNormalForm", "factor", function(seq, strand) {
  .tandemNormalForm(seq, strand)
})

#' @rdname tandemNormalForm
#' @export

setMethod("tandemNormalForm", "DNAStringSet", function(seq, strand) {
  Biostrings::DNAStringSet(.tandemNormalForm(seq, strand))
})

#' @rdname tandemNormalForm
#' @export

setMethod("tandemNormalForm", "DNAString", function(seq, strand) {
  Biostrings::DNAString(.tandemNormalForm(seq, strand))
})

#' @noRd

# This function always returns a factor
.tandemNormalForm <- function(seq, strand=c("forward", "reverse", "both")) {
  if(strand == "forward")
    return(.tandemNormalForm_onestrand(seq))
  if(strand == "reverse")
    return(.tandemNormalForm_onestrand(Biostrings::reverseComplement(Biostrings::DNAStringSet(seq))))
  forward <- as.character(.tandemNormalForm_onestrand(seq))
  reverse <- as.character(.tandemNormalForm_onestrand(Biostrings::reverseComplement(Biostrings::DNAStringSet(seq))))
  both <- ifelse(forward < reverse, forward, reverse)
  factor(both)
}

#' @noRd

# This function always returns a factor
.tandemNormalForm_onestrand <- function(seq) {
  seq <- paste0(as.character(seq), as.character(seq)) |> factor()
  # tandemNormalForm_rcpp expects the input to be already concatenated to itself
  levels(seq) <- sapply(levels(seq), tandemNormalForm_rcpp)
  seq
}
