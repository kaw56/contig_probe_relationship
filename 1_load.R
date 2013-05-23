## @knitr load
library(knitr)

# read in the chosen probe-contig pairs
probe_contig_key <- read.table("Data/array_probeset_key.txt", header = TRUE)
colnames(probe_contig_key) <- c("Probe", "Contig")

# read in the blast results
contig_blast <- read.table("Data/454_contigs_for_arrays.fastaRESULTS_summary.txt")
colnames(contig_blast) <- c("Contig", "Probe", "evalue")