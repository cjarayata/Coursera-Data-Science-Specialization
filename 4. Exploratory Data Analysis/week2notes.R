# testing - starting week 2 course 4

# lattice plotting - useful for many plots by a factor or something at once
# xyplot, bwplot (boxplots), histogram, stripplot, dotplot, splom (scatterplot matrix)
# levelplot, contourplot (for image data)

xyplot(y ~ x | f * g, data)
# f and g are the conditioning variables, these indicate an interaction

library(lattice)

xyplot(Ozone ~ Wind | factor(Month), data = airquality, layout = c(5,1))

# return an object of class trellis - these objects can be stored but usually better to save code
## this object is auto-printed to graphics device

# panel fuctions control what happens in each plot
## receive the x/y coords of data along with any optional args
xyplot(y ~ x | f, panel = function(x, y, ...){
        panel.xyplot(x, y, ...) # first call
        panel.abline(h = median(y), lty = 2 ) # add line at median
        panel.lmline(x, y, col = 2) # overlay regresion
})

# ggplot - is the best
library(ggplot2)
str(mpg)
ggplot(aes(x = displ, y = hwy), data = mpg) +
        geom_point(aes(colour = drv)) +
        geom_smooth()
qplot(hwy, data = mpg, fill = drv)

ggplot(aes(x = hwy, colour = drv), data = mpg) +
        geom_histogram()

ggplot(aes(x = displ, y = hwy), data = mpg) +
        geom_point() +
        facet_grid(drv~.) # puting tilde on left or right determines whether rows or columns


ggplot(aes(x = log(displ)), data = mpg) +
        geom_density()

# quiz
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)
pacman::p_load(ggplot2movies)

qplot(votes, rating, data = movies) + geom_smooth()
