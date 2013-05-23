## @knitr clean

# Use the probes to find the relevant entries

probes_in_brians <- merge(probe_contig_key, contig_blast, by.x=c("Probe", "Contig"), by.y=c("Probe", "Contig"))