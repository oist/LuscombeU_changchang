#' Search for telomeres
#'
#' Searches for telomeric repeats in the whole list of tandem repeats, or
#' narrowing the search on the ends of sequence features.
#'
#' @param gr A [`GenomicRanges::GRanges`] object produced by the [`loadTantan`]
#'        function
#' @param motif The telomeric sequence motif, at the end of the plus strand,
#'        like in TeloBase and the Telomerase Database.
#' @param narrow Narrow the search on the ends.
#'
#' @author Charles Plessy
#'
#' @importFrom GenomeInfoDb seqinfo seqinfo<- seqlengths seqlengths<- genome genome<-
#' @importFrom S4Vectors decode
#' @importFrom GenomicRanges start end seqnames
#' @export
#'
#' @examples
#' telomeres(exampleTantan)
#' telomeres(exampleTantan, narrow="ends")

telomeres <- function(gr, motif="TTAGGG", narrow=c("no", "ends")) {
  narrow <- match.arg(narrow)
  if(is.null(gr$normTandem)) stop ("normTandem column not found.  Check `?loadTandems`.")
  normTel <- tandemNormalForm(motif, strand="both")
  if(anyNA(seqlengths(gr))) {
    if (narrow == "ends") stop ("Missing seqlengths.")
  } else{
    seqlengthsVector <- seqlengths(gr)[seqnames(gr)|>decode()]
    gr$rstart <- seqlengthsVector - end(gr) + 1
    gr$rend <-  seqlengthsVector - start(gr) + 1
  }
  if (narrow == "no")
    tel <- gr[gr$normTandem == normTel]
  if (narrow == "ends") {
    if (tandemNormalForm(motif, strand="forward") == normTel) {
      fwdStrandMatch <- "-"
      revStrandMatch <- '+'
    } else {
      fwdStrandMatch <- "+"
      revStrandMatch <- '-'
    }
    tel <- c(
      gr[gr$normTandem == normTel & strand(gr) == fwdStrandMatch & end(gr) <= 10000],
      gr[gr$normTandem == normTel & strand(gr) == revStrandMatch & gr$rend <= 10000]
    ) |> sort(ignore.strand = TRUE)
  }
   tel
}
