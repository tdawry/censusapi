% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getcensus_functions.R
\name{getCensus}
\alias{getCensus}
\title{Retrieve Census data from a given API}
\usage{
getCensus(name, vintage = NULL, key = Sys.getenv("CENSUS_KEY"), vars,
  region = NULL, regionin = NULL, time = NULL, date = NULL,
  period = NULL, monthly = NULL, category_code = NULL,
  data_type_code = NULL, naics = NULL, pscode = NULL,
  naics2012 = NULL, naics2007 = NULL, naics2002 = NULL,
  naics1997 = NULL, sic = NULL, ...)
}
\arguments{
\item{name}{API name - e.g. acs5. See list at https://api.census.gov/data.html}

\item{vintage}{Year of dataset, e.g. 2014 - not required for timeseries APIs}

\item{key}{Your Census API key, gotten from https://api.census.gov/data/key_signup.html}

\item{vars}{List of variables to get}

\item{region}{Geography to get}

\item{regionin}{Optional hierarchical geography to limit region}

\item{time, date, period, monthly}{Optional arguments used for some time series APIs}

\item{category_code, data_type_code}{Arguments used in Economic Indicators Time Series API}

\item{naics, pscode}{Arguments used in Annual Survey of Manufactures API}

\item{naics2012, naics2007, naics2002, naics1997, sic}{Arguments used in Economy Wide Key Statistics APIs and Business Patterns APIs}

\item{...}{Other valid parameters to pass to the Census API. Note: the APIs are case sensitive.}
}
\description{
Retrieve Census data from a given API
}
\examples{
\donttest{df <- getCensus(name = "acs/acs5", vintage = 2017,
vars = c("B01001_001E", "NAME", "B01002_001E", "B19013_001E"),
region = "tract:*", regionin = "state:06")
head(df)

# Use American Community Survey variable groups to get all data from a given table.
# This returns estimates as well as margins of error and annotation flags.
acs_group <- getCensus(name = "acs/acs5",
vintage = 2017,
vars = c("NAME", "group(B19013)"),
region = "county:*")
head(acs_group)

# Retreive block-level data within a specific tract using a nested regionin argument
data2010 <- getCensus(name = "dec/sf1",
vintage = 2010,
vars = c("NAME","P001001"),
region = "block:*",
regionin = "state:36+county:027+tract:010000")
head(data2010)

# Retreive block-level data for Decennial Census sf1, 2000
# Note, for this dataset a tract needs to be specified to retrieve blocks
data2000 <- getCensus(name = "sf1",
vintage = 2000,
vars = c("P001001", "P003001"),
region = "block:*",
regionin = "state:36+county:27+tract:010000")
head(data2000)

# Get poverty rates for children and all ages over time
saipe <- getCensus(name = "timeseries/poverty/saipe",
vars = c("NAME", "SAEPOVRT0_17_PT", "SAEPOVRTALL_PT"),
region = "state:01",
time = "from 2000 to 2017")
head(saipe)

# Get county business patterns data for a specific NAICS sector
cbp_2016 <- getCensus(name = "cbp",
vintage = "2016",
vars = c("EMP", "ESTAB", "NAICS2012_TTL", "GEO_TTL"),
region = "state:*",
naics2012 = "23")
head(cbp_2016)}
}
\keyword{api}
