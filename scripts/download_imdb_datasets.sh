#!/bin/bash

# Create the data directory if it doesn't exist
mkdir -p data

# Download IMDb data files using wget
wget -O data/name.basics.tsv.gz https://datasets.imdbws.com/name.basics.tsv.gz
wget -O data/title.basics.tsv.gz https://datasets.imdbws.com/title.basics.tsv.gz
wget -O data/title.crew.tsv.gz https://datasets.imdbws.com/title.crew.tsv.gz
wget -O data/title.episode.tsv.gz https://datasets.imdbws.com/title.episode.tsv.gz
wget -O data/title.principals.tsv.gz https://datasets.imdbws.com/title.principals.tsv.gz
wget -O data/title.ratings.tsv.gz https://datasets.imdbws.com/title.ratings.tsv.gz
wget -O data/title.akas.tsv.gz https://datasets.imdbws.com/title.akas.tsv.gz

# Unzip the files
gunzip data/*.tsv.gz

# Remove the .gz files
rm data/*.tsv.gz