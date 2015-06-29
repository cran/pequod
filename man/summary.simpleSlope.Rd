\name{summary.simpleSlope}
\alias{summary.simpleSlope}
\alias{print.summary.simpleSlope}

\title{
summary  for simpleSlope object
}
\description{
return summaries for simpleSlope object
}
\usage{
\method{summary}{simpleSlope}(object,...)

}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object,...}{a simpleSlope object
}
  
}

\value{
The function summary is used to obtain  the summary of the simpleSlope results.

}

\author{
Alberto Mirisola and Luciano Seta 
}


%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{

library(car)
	data(Highway1)
	model3<-lmres(rate~len*trks*sigs1, centered=c("len","trks","sigs1"),data=Highway1)
    S_slopes<-simpleSlope(model3,pred="len",mod1="trks", mod2="sigs1")
   summary(S_slopes)

## The function is currently defined as
function (object,...) 

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
