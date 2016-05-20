library(data.table)
library(dplyr)
library(ggplot2)

setwd('~/talks/csvconf_2016_reusing_science_output/crossref_facet_data/')

## number of papers per year

year <- fread('data/published.csv')
names(year)[1] <- 'year'
year$year <- factor(year$year, levels=year$year)

options(scipen=10000)

year_plot <- ggplot(year, aes(x=year, y=count, group=year)) +
  geom_bar(stat='identity') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  xlab('Year') +
  ylab('Number of papers added to Crossref')
year_plot
ggsave(year_plot, file='plots/papers_per_year.png', width=10, height=5)
ggsave(year_plot, file='plots/papers_per_year.pdf', width=10, height=5)


## number of papers by publisher

pub <- fread('data/publisher-name.csv')
names(pub)[1] <- 'pub'
pub$pub <- factor(pub$pub, levels=pub$pub)

options(scipen=10000)

pub_plot <- ggplot(pub, aes(x=pub, y=count, group=pub)) +
  geom_bar(stat='identity') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  xlab('Publisher name') +
  ylab('Number of papers in Crossref')
pub_plot
ggsave(pub_plot, file='plots/papers_per_publisher.png', width=10, height=6.5)
ggsave(pub_plot, file='plots/papers_per_publisher.pdf', width=10, height=6.5)


## number of papers by funder

funder <- fread('data/funder-name.csv')
names(funder)[1] <- 'funder'
funder$funder <- factor(funder$funder, levels=funder$funder)

options(scipen=10000)

funder_plot <- ggplot(funder, aes(x=funder, y=count, group=funder)) +
  geom_bar(stat='identity') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  xlab('Funder name') +
  ylab('Number of papers in Crossref') +
  theme(plot.margin = unit(c(1,1,1,3), "cm"))
funder_plot
ggsave(funder_plot, file='plots/papers_per_funder.png', width=10, height=6.5)
ggsave(funder_plot, file='plots/papers_per_funder.pdf', width=10, height=6.5)

## number of papers by license

license <- fread('data/license.csv')
names(license)[1] <- 'license'
license$short <- factor(license$short, levels=license$short)
options(scipen=10000)

license_plot <- ggplot(license, aes(x=short, y=count, fill=open)) +
  geom_bar(stat='identity') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  xlab('License') +
  ylab('Number of papers in Crossref')
license_plot
ggsave(license_plot, file='plots/papers_per_license.png', width=10, height=5)
ggsave(license_plot, file='plots/papers_per_license.pdf', width=10, height=5)
license_plot <- ggplot(license, aes(x=open, y=count, group=license)) +
  geom_bar(stat='identity') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  xlab('Open') +
  ylab('Number of papers in Crossref')
license_plot
ggsave(license_plot, file='plots/papers_open.png', width=10, height=5)
ggsave(license_plot, file='plots/papers_open.pdf', width=10, height=5)
