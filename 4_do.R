## @knitr table
library(plyr)

# table of representative probe data

# mean evalue

mean_evalue <- mean(probes_in_brians$evalue)

range_evalue <- range(probes_in_brians$evalue)

lowest  <- range_evalue[1]
highest <- range_evalue[2]

subset(probes_in_brians, evalue == highest)

# boxplot
stupid <- rep("stupid", length(probes_in_brians$Probe))
probes_in_brians <- cbind(probes_in_brians, stupid)
ggplot(probes_in_brians, aes(x= stupid, y = evalue)) + geom_boxplot() + 
    scale_y_log10()