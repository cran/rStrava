% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compile_activity.R
\name{compile_activity}
\alias{compile_activity}
\title{convert a single activity list into a dataframe}
\usage{
compile_activity(x, columns)
}
\arguments{
\item{x}{a list containing details of a single Strava activity}

\item{columns}{a character vector of all the columns in the list of Strava activities. Produced automatically in \code{\link{compile_activities}}. Leave blank if running for a single activity list.}
}
\value{
dataframe where every column is an item from a list. Any missing columns rom the total number of columns
}
\description{
convert a single activity list into a dataframe
}
\details{
used internally in \code{\link{compile_activities}}
}
\examples{
\dontrun{
stoken <- httr::config(token = strava_oauth(app_name, app_client_id, app_secret, cache = TRUE))

acts <- get_activity_list(stoken)

compile_activity(acts[1])}
}
\author{
Daniel Padfield
}
\concept{token}
