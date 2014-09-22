\name{shapeInteractive-package}
\alias{shapeInteractive-package}
\alias{shapeInteractive}
\docType{package}
\title{interact with shapefiles}
\description{GIS-like interaction with shapefiles:
zoom in  ESRI shapefile plots,
show or change attributes by clicking on them in a plot.
Currently only works for Line-shapefiles.
Further development from my side is not planned in 2014,
as I want to focus on my (soon to be) CRAN package extremeStat.}
\note{
At some places you'll find \code{## not run} in the examples.
These code blocks were excluded from checking while building,  because they are interactive and need mouseclicks, or because they open another device/file.
\cr Normally, you should be able to run them in an interactive session.
If you do find unexecutable code, please tell me!\cr
Feel free to suggest packages in which these functions would fit well.
I strongly depend on - and therefore welcome - any feedback!
}
\author{Berry Boessenkool, \email{berry-b@gmx.de}, 2011-2014}
\examples{
\dontrun{
library(maptools, spatstat)
xx <- readShapeLines(system.file("shapes/fylk-val.shp", package="maptools")[1],
                     proj4string=CRS("+proj=utm +zone=33 +datum=WGS84"))

# Show attribute of ESRI-Shapefile element by mouseclick: showAttribute
plot(xx)
showAttribute(xx)

# change Attribute of ESRI GIS-Shapefile : changeAttribute
summary(xx["VALINJE_"])
xx2 <- changeAttribute(xx, coltochange="VALINJE_", changeto=115)
summary(xx2["VALINJE_"]) # new maximum

# zoom into ESRI shapefiles: shapeZoom
windows(record=TRUE)
plot(xx)
shapeZoom(xx)


### spatial functions in berryFunctions ########################################
install.packages("berryFunctions")
require(berryFunctions)

# arrange points randomly with minimal distance to each other: randomPoints
randomPoints(xmin=5,xmax=15, ymin=20,ymax=30, number=25, mindist=1)

# distance between two points on a plane: distance
A <- c(3,  9,-1)  ;  B <- c(7, -2, 4)
distance(A,B, 3,5)
plot(A,B); points(3,5, col=2, pch=16); segments(3,5, A,B)

# calculate Area of a planar triangle: triangleArea
a <- c(1,5.387965,9); b <- c(1,1,5)
plot(a[c(1:3,1)], b[c(1:3,1)], type="l", asp=1)
abline(v=1:9, h=1:5, col=8,lty=2)
triangleArea(a,b)
}
}
\keyword{package}
\keyword{documentation}
