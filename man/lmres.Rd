\name{lmres}
\alias{lmres}
\alias{lmres.default}
\alias{print.lmres}
\title{
Moderated regression with residual centering}
\description{
Fit moderated linear regression with both residual centering and mean centering methods. 
}
\usage{
lmres(formula, data, residual_centering, centered, ...)
\method{lmres}{default}(formula, data, residual_centering=FALSE, centered = "none", ...)

}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{formula}{
an object of class "formula": a symbolic description of the model to be fitted. 
}
  \item{data}{
a data frame
}
\item{centered}{
variables wich must be centered 
}
 \item{residual_centering}{
"FALSE" generate a moderated using standard lm regression, "TRUE" generate a moderated regression with residuals centering
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
Moderated regression  without residual centering : For any interaction term,  the product is computed  and  entered in the final model. In order to perform a mean centered moderated regression, predictors must be centered
Moderated regression with residual centering: For any interaction term with order n, a regression with low order terms (n-1) is computed, and Interaction residuals are entered in the final model.
}
\value{
lmres returns an object of class "lmres". 
 
An object of class "lmres" is a list containing at least the following components:

\item{regr.order}{the numeric order of the fitted linear model}
\item{formula.StepI}{the formula of the first order regression}
\item{formula.StepII}{(only where relevant) the formula of the second order regression}
\item{formula.Stepfin}{the formula of the x (max(x)=3) order regression}
\item{beta.StepI}{a named vector of standardized coefficients for the first order regression} 
\item{beta.StepII}{(only where relevant) a named vector of standardized coefficients for the second order regression} 
\item{beta.Stepfin}{a named vector of standardized coefficients for the x (max(x)=3)  order regression}
\item{StepI}{a lm object for the first order regression }
\item{StepII}{(only where relevant) a lm object for the second order regression }
\item{Stepfin}{a lm object for the x (max(x)=3)  order regression}
\item{F_change}{is a list containing F change statistics }

}
\references{
Little, T. D., Bovaird, J. A., & Widaman, K. F. (2006). On the Merits of Orthogonalizing Powered and Product Terms: Implications for Modeling Interactions Among Latent Variables. Structural Equation Modeling, 13(4), 497-519.

Cohen, J., Cohen, P.,West, S. G.,&Aiken, L. S. (2003). Applied multiple regression/correlation analysis for the behavioral sciences (3rd ed.). Mahwah, NJ: Lawrence Erlbaum Associates, Inc.
}
\author{
Alberto Mirisola and Luciano Seta 
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\dQuote{summary.lmres}
}
\examples{
	
	## moderated regression with mean centering
	library(car)
	data(Ginzberg)
	model1<-lmres(adjdep~adjsimp*adjfatal, centered=c("adjsimp", "adjfatal"),
	data=Ginzberg)
	
	## moderated regression with mean centering
	library(car)
	data(Ginzberg)
	model1<-lmres(adjdep~adjsimp*adjfatal, centered=c("adjsimp", "adjfatal"),
	data=Ginzberg)
	## moderated regression with mean centering
	model2<-lmres(adjdep~adjsimp*adjfatal,residual_centering=TRUE,
	centered=c("adjsimp", "adjfatal"), data=Ginzberg)
	## three way interaction with mean centering
	library(car)
	data(Highway1)
	model3<-lmres(rate~len*trks*sigs1, centered=c("len","trks","sigs1"),data=Highway1)

## The function is currently defined as
function (formula, data, centered, ...) 
UseMethod("lmres")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
