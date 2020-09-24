% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helper_decode_player_ids.R
\name{decode_player_ids}
\alias{decode_player_ids}
\title{Decode the player IDs in nflfastR play-by-ply data}
\usage{
decode_player_ids(pbp)
}
\arguments{
\item{pbp}{is a Data Frame of play-by-play data scraped using \code{\link{fast_scraper}}.}
}
\value{
The input Data Frame of the parameter 'pbp' with decoded player IDs.
}
\description{
Decode the player IDs in nflfastR play-by-ply data
}
\details{
Take all columns ending with \code{player_id} as well as
\code{passer_id}, \code{rusher_id}, \code{receiver_id}, \code{id} of an
nflfastR play-by-play Data set and decode the player IDs to the commonly
known GSIS ID format 00-00xxxxx.
The function requires the package \code{furrr} if the data frame
\code{pbp} has more than 4500 rows.
}