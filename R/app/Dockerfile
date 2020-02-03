# Base image 
FROM markzwart76/r_graydon_reporting:1.0

# Create data directories
RUN mkdir -p /data/risk_analysis_nl/market
RUN mkdir -p /data/risk_analysis_nl/customers
RUN mkdir -p /data/risk_analysis_nl/intermediate

# Create R report 'app'
RUN mkdir -p /app

## Copy files
COPY *.R /app/
COPY *.sh /app/
ADD risk_analysis_nl /app/risk_analysis_nl
