# total number of probes that brian used
total_probes <- length(probe_contig_key$Probe)
# number of forward and reverse probes
total_each_type <- ddply(probe_contig_data, "type",
                         summarise,
                         n = length(Contig))

# average number of probes per contig 
total_each_contig <- ddply(probe_contig_data, "Contig",
                           summarise,
                           Probe_num = length(Probe))

subset(total_each_contig, n == 1)
subset(total_each_contig, n == 3)

# the number of contigs per probe
total_each_probe <- ddply(probe_contig_data, "Probe",
                          summarise,
                          Contig_num = length(Contig))

mean(total_each_probe$Contig_num)

# see if they use the same probes (somehow)

# mean evalue

mean_evalue <- mean(probes_in_brians$evalue)

range_evalue <- range(probes_in_brians$evalue)

lowest  <- range_evalue[1]
highest <- range_evalue[2]

subset(probes_in_brians, evalue == highest)

stupid <- rep(stupid, length(probes_in_brians$Probe))

probes_in_brians <- cbind(probes_in_brians, stupid)

ggplot(probes_in_brians, aes(x= stupid, y = evalue)) + geom_boxplot()