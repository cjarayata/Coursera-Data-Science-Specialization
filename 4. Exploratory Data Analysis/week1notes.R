# base plotting
# base is "artist's pallete model" - start with blank canvas and adding onto it one by one

# start with plot function, then annotation

# drawbacks: can't go backwards, can't translate plot to others, it's just a bunch of R code

data(cars)
plot(cars$speed, cars$dist)

# lattice plotting - single function calls that specify an entire plot
## useful for looking at many plots at once
## margins and such set automatically because whole plot is specified at once

# can be awkward, annotation not intuitive, can't add to plot once it's done

library(lattice)
state <- data.frame(state.x77, region = state.region)

xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1))

# ggplot2 - is the best - mixes elements of base and lattice
library(ggplot2)
ggplot(mpg, aes(x = displ, y = hwy)) +
        geom_point()

## base ##
# graphics package, grDevices

hist(airquality$Ozone)

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in NYC"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

str(airquality)
airquality$Month <- factor(airquality$Month)

boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

# parameters:
# pch, plotting symbol
# lty: line type
# lwd: line width
# col: plotting color
# xlab, ylab

# global pars: affect all plots in an R session
# las: orientation of axis labels
# bg: background color
# mar: margin
# oma: outer margin
# mfrow: num plots per row/column (row-wise)
# mfcol: num plots per row/column (col-wise)

# you can plot a blank canvas with type = "n" parameter
# helpful if you're going to plot things separately or overlay based on factor levels

# graphics device: screen device or file device?
## you can open multiple graphics devices
dev.cur() # returns integer to tell you which graphics device is currently open (2 and up)
dev.set([integer]) # set a new graphics device to send plots to

# for printing, example:
pdf(file = "myplot.pdf") # open PDF device, create file
ggplot() # create plot and send to file
dev.off() # close PDF file device; plot is now written