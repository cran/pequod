\name{summary.lmres}
\alias{summary.lmres}
\alias{print.summary.lmres}

\title{
summary  for lmres object
}
\description{
return simple and nested summaries
}
\usage{
summary.lmres(object, type = "default", ...)

}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{a lmres object
}
  \item{type}{
"default" generate a lm output, "nested" generate a hierarchical regression output
}
 \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
The function summary is used to obtain a simple of nested summary of the results.

}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Alberto Mirisola and Luciano Seta 
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

library(car)
data(Ginzberg)
model1<-lmres(adjdep~adjsimp*adjfatal, centered=c("adjsimp", "adjfatal"), data=Ginzberg)

summary(model1)
summary(model1, type="nested")

## The function is currently defined as
function (object, type = "default", ...) 

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
