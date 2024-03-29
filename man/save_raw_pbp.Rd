% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/save_raw_pbp.R
\name{save_raw_pbp}
\alias{save_raw_pbp}
\title{Download Raw PBP Data to Local Filesystem}
\usage{
save_raw_pbp(
  game_ids,
  dir = getOption("nflfastR.raw_directory", default = NULL)
)
}
\arguments{
\item{game_ids}{A vector of nflverse game IDs.}

\item{dir}{Path to local directory (defaults to option "nflfastR.raw_directory").
nflfastR will download the raw game files split by season into one sub
directory per season.}
}
\value{
The function returns a data frame with one row for each downloaded file and
the following columns:
\itemize{
\item \code{success} if the HTTP request was successfully performed, regardless of the
response status code. This is \code{FALSE} in case of a network error, or in case
you tried to resume from a server that did not support this. A value of \code{NA}
means the download was interrupted while in progress.
\item \code{status_code} the HTTP status code from the request. A successful download is
usually \code{200} for full requests or \code{206} for resumed requests. Anything else
could indicate that the downloaded file contains an error page instead of the
requested content.
\item \code{resumefrom} the file size before the request, in case a download was resumed.
\item \code{url} final url (after redirects) of the request.
\item \code{destfile} downloaded file on disk.
\item \code{error} if \code{success == FALSE} this column contains an error message.
\item \code{type} the \code{Content-Type} response header value.
\item \code{modified} the \code{Last-Modified} response header value.
\item \code{time} total elapsed download time for this file in seconds.
\item \code{headers} vector with http response headers for the request.
}
}
\description{
The functions \code{\link[=build_nflfastR_pbp]{build_nflfastR_pbp()}} and \code{\link[=fast_scraper]{fast_scraper()}} support loading
raw pbp data from local file systems instead of Github servers.
This function is intended to help setting this up. It loads raw pbp data
and saves it in the given directory split by season in subdirectories.
}
\examples{
\donttest{
# CREATE LOCAL TEMP DIRECTORY
local_dir <- tempdir()

# LOAD AND SAVE A GAME TO TEMP DIRECTORY
save_raw_pbp("2021_20_BUF_KC", dir = local_dir)

# REMOVE THE DIRECTORY
unlink(file.path(local_dir, 2021))
}
}
\seealso{
\code{\link[=build_nflfastR_pbp]{build_nflfastR_pbp()}}, \code{\link[=missing_raw_pbp]{missing_raw_pbp()}}
}
