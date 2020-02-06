library(plumber)
r <- plumb("~/app/risk_analysis_nl/make_reports.R")
r$run(port=80, host="0.0.0.0")

