\name{PlotSlope}
\alias{PlotSlope}
\title{
Simple slopes plot }
\description{
Simple slope plot for two and three way interactions. 
}
\usage{
PlotSlope(object, namemod = "default", namex = "default",
namey = "default", limitx = "default", limity = "default")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
an object of class "simpleSlope". 
}
  \item{namemod}{
	a character verctor of the moderator points. If "default" is used, default setting is printed.
}
\item{namex}{
name of the predictor. If "default" is used, the predictor name  in the dataframe is printed.
}
 \item{namey}{
name of the dependent variable. If "default" is used, the dataframe name is printed.
}
 \item{limitx}{
a numeric vector for setting limits of x axis.
}
\item{limity}{
a numeric vector for setting limits of y axis.
}
}
\details{
	Plot for Simple slope analysis.
}
\value{
PlotSlope returns an object of class "ggplot". 
 

}

\author{
Alberto Mirisola and Luciano Seta 
}



\examples{
	
	## Default plot for three way interaction
	
	library(car)
	data(Highway1)
	model3<-lmres(rate~len*trks*sigs1, centered=c("len","trks","sigs1"),data=Highway1)
	S_slopes<-simpleSlope(model3,pred="len",mod1="trks", mod2="sigs1")
	Plot<-PlotSlope(S_slopes)
	
	## Personalized plot for three way interaction
	
	library(car)
	data(Highway1)
	model3<-lmres(rate~len*trks*sigs1, centered=c("len","trks","sigs1"),data=Highway1)
	S_slopes<-simpleSlope(model3,pred="len",mod1="trks", mod2="sigs1")
	Plot<-PlotSlope(S_slopes, namemod=c("Low truck volume (-1SD),
	Low number of signals per mile (-1 SD)","Low truck volume (-1SD),
	High number of signals per mile (+1 SD)","High truck volume (+1SD),
	Low number of signals per mile (-1 SD)","High truck volume (+1SD), 
	High number of signals per mile (+1 SD)"),
	namex="length of the Highway1\n segment in miles",
	namey="1973 accident rate \n per million vehicle miles",
	limitx=c(-9,9), limity=c(-2,9))


## The function is currently defined as
function(object, namemod = "default", 
namex = "default", namey = "default", limitx = "default", 
limity = "default") {

pmatr <- object$Points
nomY <- object$nomY
nomX <- object$nomX
X_1L <- object$X_1L
X_1H <- object$X_1H

if (object$orde == 2) {
nam <- dimnames(object$simple_slope)[1]
nam <- nam[[1]]
r1 <- nam[1]
r2 <- nam[2]

xini <- rep(X_1L, 4)
xend <- rep(X_1H, 4)
fact <- c(5, 6)
mat <- cbind(fact, xini, pmatr[, 1], xend, pmatr[, 2])
mat <- as.data.frame(mat)
names(mat) <- c("fact", "xini", "yini", "xend", "yend")
p <- ggplot(mat, aes(x = xini, y = yini))
p1 <- p + geom_segment(aes(xend = xend, yend = yend))
p1 <- p1 + scale_x_continuous(nomX) + scale_y_continuous(nomY)
p1 <- p1 + geom_point(size = 3, aes(shape = factor(fact))) + 
geom_point(aes(x = xend, y = yend, shape = factor(fact)), 
size = 3)

if (length(namemod) == 1) {
p1 <- p1 + scale_shape(name = "Moderator", breaks = c(5, 
6), labels = c(r1, r2))
  }
if (length(namemod) > 1) {
if (length(namemod) != 2) {
stop("length of namemod vector must be = 2")
  }
p1 <- p1 + scale_shape(name = "Moderator", breaks = c(5, 
6), labels = namemod)
  }

if (namex != "default") {
if (length(limitx) == 2) {
p1 <- p1 + scale_x_continuous(namex, limits = limitx)
  }
else {
p1 <- p1 + scale_x_continuous(namex)
  }

  }

if (namey != "default") {
if (length(limity) == 2) {
p1 <- p1 + scale_y_continuous(namey, limits = limity)
  }
else {
p1 <- p1 + scale_y_continuous(namey)
  }
  }



return(p1)
  }

if (object$orde == 3) {

nam <- dimnames(object$simple_slope)[1]
nam <- nam[[1]]
r1 <- nam[1]
r2 <- nam[2]
r3 <- nam[3]
r4 <- nam[4]


xini <- rep(X_1L, 4)
xend <- rep(X_1H, 4)
fact <- c(5, 6, 7, 8)
mat <- cbind(fact, xini, pmatr[, 1], xend, pmatr[, 2])
mat <- as.data.frame(mat)
names(mat) <- c("fact", "xini", "yini", "xend", "yend")
p <- ggplot(mat, aes(x = xini, y = yini))
p1 <- p + geom_segment(aes(xend = xend, yend = yend))
p1 <- p1 + scale_x_continuous(nomX) + scale_y_continuous(nomY)
p1 <- p1 + geom_point(size = 3, aes(shape = factor(fact))) + 
geom_point(aes(x = xend, y = yend, shape = factor(fact)), 
size = 3)
if (length(namemod) == 1) {
p1 <- p1 + scale_shape(name = "Moderators Combination", 
breaks = c(5, 6, 7, 8), labels = c(r1, r2, r3, 
r4))
  }
if (length(namemod) > 1) {
if (length(namemod) != 4) {
stop("length of namemod vector must be = 4")
  }
p1 <- p1 + scale_shape(name = "Moderators Combination", 
breaks = c(5, 6, 7, 8), labels = namemod)
  }
p2 <- p1

if (namex != "default") {
if (length(limitx) == 2) {
p2 <- p2 + scale_x_continuous(namex, limits = limitx)
  }
else {
p2 <- p2 + scale_x_continuous(namex)
  }

  }

if (namey != "default") {
if (length(limity) == 2) {
p2 <- p2 + scale_y_continuous(namey, limits = limity)
  }
else {
p2 <- p2 + scale_y_continuous(namey)
  }
  }

return(p2)
  }

  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
