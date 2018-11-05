setwd("C:/Users/carayata/Desktop/datasciencecoursera/4. Exploratory Data Analysis/Week 4 Project")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

library(plyr, dplyr)

# Create summary table
year.table <- ddply(NEI, ~year, summarise,
                    total.emissions = sum(Emissions))

# Plot and mess with formatting
plot(year.table, main = "Total Emissions in the US, 1999 - 2008",
     xlab = "Year",
     ylab = "Total emissions from all sources (tons)",
     col = "red",
     pch = 19)

myTicks = axTicks(2)
axis(2, at = myTicks, labels = formatC(myTicks, format = 'd'))

# Plot 1: save
png(filename = "plot1.png", width = 480, height = 480)
plot(year.table, main = "Total Emissions in the US, 1999 - 2008",
     xlab = "Year",
     ylab = "Total emissions from all sources (tons)",
     col = "red",
     pch = 19)
lines(year.table$year, year.table$total.emissions, col = "red")
dev.off()

# Yes, total emissions have decreased