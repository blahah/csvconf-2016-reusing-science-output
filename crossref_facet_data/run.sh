#! /bin/sh

mkdir data plots

curl -L http://api.crossref.org/works?facet=t > data/works.json

node scripts/extract.js

RScript scripts/plot.R
