## @knitr clean
library(plyr)
# Use the probes to find the relevant entries

probes_in_brians <- merge(probe_contig_key, contig_blast, by.x=c("Probe", "Contig"), by.y=c("Probe", "Contig"))

# filter into new data frames and add a level column so I can use ddply
# all contig
contig <- probe_contig_key[grepl("^contig\\d{5}", probe_contig_key$Contig),]
contig$type <- rep("contig", length(contig$Probe))

# all rccontig
rc_contig <- probe_contig_key[grepl("rc_contig\\d{5}", probe_contig_key$Contig),]
rc_contig$type <- rep("rc_contig", length(rc_contig$Probe))

# all not either
other <- probe_contig_key[!grepl("contig", probe_contig_key$Contig),]
other$type <- rep("other", length(other$Probe))

# put the data frame back together

probe_contig_data <- rbind(contig, rc_contig, other)
