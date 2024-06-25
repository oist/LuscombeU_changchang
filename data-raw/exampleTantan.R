## code to prepare `DATASET` dataset goes here
exampleTantan <- loadTantan(system.file('extdata/example.bed.xz', package="changchang"))
seqlengths(exampleTantan) <- 2233465
genome(exampleTantan) <- "example"
isCircular(exampleTantan) <- FALSE
usethis::use_data(exampleTantan, overwrite = TRUE)
