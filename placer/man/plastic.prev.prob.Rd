% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plastic_estimation.R
\name{plastic.prev.prob}
\alias{plastic.prev.prob}
\title{Plastic prevalence probability}
\usage{
plastic.prev.prob(plastic_abs_pres, num_sample)
}
\arguments{
\item{plastic_abs_pres}{numeric vector, containing a binary values with 0
or 'no' for absence of plastic, and 1 or 'yes' for presence of plastic.}

\item{num_sample}{integer value, specifying the number of samples to
randomly draw from the observations.}
}
\value{
Prevalence probability of plastic debris in a given sample size.
}
\description{
\code{plastic.prev.prob} estimates the prevalence probability of plastic
from a randomly selected sample of absence/presence observations of plastic
debris.
}
\examples{
plastic.prev.prob(rbinom(1000,1,0.5), 1)
plastic.prev.prob(rbinom(1000,1,0.5), 10)
}
\seealso{
\code{\link{plastic.ci}}, \code{\link{prevalence_plot}}
}
