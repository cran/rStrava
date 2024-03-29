% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compile_seg_effort.R
\name{compile_seg_effort}
\alias{compile_seg_effort}
\title{Compile the efforts of a segment}
\usage{
compile_seg_effort(x)
}
\arguments{
\item{x}{A list object produced by \code{\link{get_efforts_list}}}
}
\value{
A dataframe containing all of the efforts of a specific segment. The columns returned are \code{athlete.id}, \code{distance}, \code{elapsed_time}, \code{moving_time}, \code{name}, \code{start_date} and \code{start_date_local}.
}
\description{
Cleans up the output of get_efforts_list() into a dataframe
}
\details{
Used internally in \code{\link{compile_seg_efforts}}. Can be used on the output of \code{\link{get_efforts_list}} to compile the segment efforts of a single segment. Each call to \code{\link{get_efforts_list}} returns a large list. This function returns a subset of this information.
}
\examples{
\dontrun{
# set token
stoken <- httr::config(token = strava_oauth(app_name, app_client_id, app_secret, cache = TRUE))

# segments to get efforts from - use some parkruns
segment <- 2269028

# get segment efforts
efforts <- get_efforts_list(stoken, segment)

# compile efforts
efforts <- compile_seg_effort(efforts)
}
}
\author{
Daniel Padfield
}
\concept{notoken}
