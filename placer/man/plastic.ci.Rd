% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plastic_estimation.R
\name{plastic.ci}
\alias{plastic.ci}
\title{Confidence intervals of plastic prevalence probability}
\usage{
plastic.ci(plastic_abs_pres, max_sample_size = 300, bs_rep = 1000,
  lower_ci = 0.025, upper_ci = 0.975)
}
\arguments{
\item{plastic_abs_pres}{numeric vector, containing a binary values with 0
or no for absence of plastic, and 1 or yes for presence of plastic.}

\item{max_sample_size}{integer, specifying the maximum number of
samples to use for estimating the prevalence of plastic debris.
By default 300 samples.}

\item{bs_rep}{integer, specifying the number of bootstrap replications.
By default 1000 replications.}

\item{lower_ci}{numeric, specifying lower confidence interval.
By default 2.5\%.}

\item{upper_ci}{numeric, specifying upper confidence interval.
By default 97.5\% default.}
}
\value{
A list with a data frame with estimated confidence intervals,
  and with a matrix with prevalence probability of plastic debirs for all
  sample sizes and their bootstrap replicates
}
\description{
Bootstrap simulations to estimate plastic prevalence probability.
The confidence intervals are calculated in a sequence of varying
sample sizes.
}
\examples{
plastic.ci(rbinom(1000,1,0.5))
}