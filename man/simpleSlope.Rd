\name{simpleSlope}
\alias{simpleSlope}
\alias{simpleSlope.default}
\alias{print.simpleSlope}
\title{
Simple slopes analysis for Moderated regression}
\description{
Simple slope analysis according to Cohen, Cohen, West, & Aiken (2003); Bauer & Curran, (2005); and Dawson and Richter (2006) approaches. 
}
\usage{
simpleSlope(object, pred, mod1, mod2, coded, ...)
\method{simpleSlope}{default}(object, pred, mod1, mod2="none",coded = "none", ...)

}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
an object of class "lmres": a moderated regression function. 
}
  \item{pred}{
name of the predictor variable
}
\item{mod1}{
name of the first moderator variable
}
 \item{mod2}{
name of the second moderator variable.  Default "none" is used in order to analyzing two way interaction,
}
 \item{coded}{
a character vector of coded variables
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
	Simple slope analysis for moderated regression. If two way interaction is analyzed, the function computes simple slope analysis and region of significance( Bauer & Curran, 2005). 
	If three way interaction is analyzed, the function compute simple slope analysis and difference slope test (Dawson and Richter, 2006).
}
\value{
simpleSlope returns an object of class "simpleSlope". 
 
An object of class "simpleSlope" is a list containing at least the following components:

\item{nomY}{the name of dependent variable}
\item{orde}{it's 2 for two way interaction, it's 3 for three way interaction }
\item{points}{ Estimated points of dependent variable as a function of levels of moderators and predictor}
\item{simple_slope}{a matrix summarizing simple slopes results}
\item{delta_slope}{(only for three way interaction)a matrix summarizing difference slope tests } 
\item{Df}{degree of freedom} 
\item{conf95}{(only for two way interaction)confidence interval of moderator region of significance}


}
\references{
-Bauer, D. J., & Curran, P. J. (2005). Probing Interactions in Fixed and Multilevel Regression: Inferential and Graphical Techniques. Multivariate Behavioral Research, 40(3), 373-400.
-Cohen, J., Cohen, P.,West, S. G.,& Aiken, L. S. (2003). Applied multiple regression/correlation analyses
for the behavioral sciences (3rd ed.). Mahwah, NJ: Lawerence Erlbaum Associates, Inc.
- Dawson, J. F., and Richter, W. (2006) Probing Three-Way interactions in moderated multiple regression: Development and application of a slope difference test. Journal of Applied Psychology, 4, 917-926. 
}
\author{
Alberto Mirisola and Luciano Seta 
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\dQuote{summary.simpleSlope}
}
\examples{
	
	## simple slope for three way interaction
	
	library(car)
	data(Highway1)
	model3<-lmres(rate~len*trks*sigs1, centered=c("len","trks","sigs1"),data=Highway1)
    S_slopes<-simpleSlope(model3,pred="len",mod1="trks", mod2="sigs1")


## The function is currently defined as
function (object, pred, mod1, mod2, coded, ...) 
UseMethod("simpleSlope")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
