library(data.table)
library(dplyr)
library(ggplot2)

setwd('~/talks/csvconf_2016_reusing_science_output/getpapers_demo/nano/minedterms_summary')

plotterm <- function(term, fullname) {
  df <- fread(paste(term, 'csv', sep='.'))
  sorted <- data.frame(table(df[,term,with=FALSE])) %>%
    arrange(-Freq) %>%
    top_n(20)
  sorted$Var1 <- factor(sorted$Var1, levels=sorted$Var1)
  p <- ggplot(sorted, aes(x=Var1, y=Freq / 319 * 100)) +
    geom_bar(stat="identity") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    xlab(fullname) +
    ylab('% of papers mentioning')
  ggsave(p, file=paste('../../plots/', term, '.png', sep=''), width=10, height=6.5)
}

plotterm('efo', 'Experimental factor')
plotterm('disease', 'Disease')
plotterm('gene_protein', 'Gene or Protein')
