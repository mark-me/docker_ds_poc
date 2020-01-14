# Base image 
FROM markzwart76/r_graydon_reporting:1.0

# create directories
RUN mkdir -p /general_data
RUN mkdir -p /customer_data
RUN mkdir -p /config
RUN mkdir -p /app

## copy files
COPY *.R /app/
COPY *.css /app/
COPY config.yml /app/
COPY report.RMD /app/

