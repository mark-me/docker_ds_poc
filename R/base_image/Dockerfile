# Base image 
FROM rocker/geospatial:3.5.3

# install the linux libraries needed for plumber
RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libcurl4-gnutls-dev

# create directories
RUN mkdir -p /home/project
RUN mkdir -p /home/project/input_data
RUN mkdir -p /home/prohect/output
RUN mkdir -p /data

# copy files
COPY install_packages.R install_packages.R

# install R-packages
RUN Rscript /install_packages.R
