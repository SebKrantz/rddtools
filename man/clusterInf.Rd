% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clusterInf.R
\name{clusterInf}
\alias{clusterInf}
\title{Post-inference for clustered data}
\usage{
clusterInf(object, clusterVar, vcov. = NULL, type = c("df-adj", "HC"), ...)
}
\arguments{
\item{object}{Object of class lm, from which rdd_reg also inherits.}

\item{clusterVar}{The variable containing the cluster attributions.}

\item{vcov.}{Specific covariance function to pass to coeftest. See help of sandwich}

\item{type}{The type of cluster correction to use: either the degrees of freedom, or a HC matrix.}

\item{\ldots}{Further arguments passed to coeftest}
}
\value{
The output of the coeftest function, which is itself of class \code{coeftest}
}
\description{
Correct standard-errors to account for clustered data, doing either a degrees of freedom correction or using a heteroskedasticidty-cluster robust covariance matrix
possibly on the range specified by bandwidth
}
\examples{
data(house)
house_rdd <- rdd_data(y=house$y, x=house$x, cutpoint=0)
reg_para <- rdd_reg_lm(rdd_object=house_rdd)

# here we just generate randomly a cluster variable:
nlet <- sort(c(outer(letters, letters, paste, sep='')))
clusRandom <- sample(nlet[1:60], size=nrow(house_rdd), replace=TRUE)

# now do post-inference:
clusterInf(reg_para, clusterVar=clusRandom)
clusterInf(reg_para, clusterVar=clusRandom, type='HC')
}
\references{
Wooldridge (2003) Cluster-sample methods in applied econometrics. 
\emph{AmericanEconomic Review}, 93, p. 133-138
}
\seealso{
\code{\link{vcovCluster}}, which implements the cluster-robust covariance matrix estimator used by \code{cluserInf}
}
