% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/majestic_all.R
\name{majestic_all}
\alias{majestic_all}
\title{Majestic All}
\usage{
majestic_all(url, api_key)
}
\arguments{
\item{url}{An URL you'd like to investigate.}

\item{api_key}{An identification key assigned to a user after subscribing to Majestic that is available via Profile page.}
}
\value{
majestic_all provides all backlink data of an UR
}
\description{
This function provides both all backlink data of and URL and its roots domain, including its CitationFlow, TrustFlow, and Root domain.
}
\examples{
\dontrun{
url <- "https://dataseolabs.com/fr/"
api_key <- "xxxxxxxxxxxxxxxxxxx"
majestic_all(url, api_key)
}
}
