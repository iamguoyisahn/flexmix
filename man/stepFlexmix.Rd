\name{stepFlexmix}
\alias{stepFlexmix}
\title{Run FlexMix Repeatedly}
\description{
  Runs flexmix repeatedly for different numbers of components and return
  the maximum likelihood solution for each.}
}
\usage{
stepFlexmix(..., K=NULL, nrep=3,
            compare=c("logLik", "BIC", "AIC"), verbose=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{\dots}{passed to \code{\link{flexmix}}}
  \item{K}{A vector of integers passed in turn to the \code{k} argument
    of \code{\link{flexmix}}}
  \item{nrep}{For each value of \code{k} run \code{\link{flexmix}}
    \code{nrep} times and keep only the solution with maximum
    likelihood.}
  \item{compare}{Goodness of fit measure used to select the best model,
    one of \code{"logLik"}, \code{"BIC"} or \code{"AIC"}.}
  \item{verbose}{If \code{TRUE}, show progress information during
    computations.}
}
\value{
  A list of objects of class \code{"flexmix"} if \code{length(K)>1},
  else directly an object of class \code{"flexmix"}.
}
\author{Friedrich Leisch}
\references{
  Friedrich Leisch. FlexMix: A general framework for finite mixture
  models and latent class regression in R. Journal of Statistical
  Software, 11(8), 2004. http://www.jstatsoft.org/v11/i08/
}
\examples{
data(NPreg)

## try 5 times for k=2
ex1 <- stepFlexmix(yn~x+I(x^2), data=NPreg, K=2, nrep=5)
ex1

## now for k=2,3,4,5
## low nrep to have reasonable execution time of example
## even on slow systems
ex2 <- stepFlexmix(yn~x+I(x^2), data=NPreg, K=2:5, nrep=2)
ex2
sapply(ex2, logLik)

## model selection:
sapply(ex2, AIC)
sapply(ex2, BIC)
}
\keyword{cluster}% at least one, from doc/KEYWORDS
\keyword{regression}% __ONLY ONE__ keyword per line