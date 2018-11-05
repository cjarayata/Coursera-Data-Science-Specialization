setwd("C:/Users/carayata/Desktop/datasciencecoursera/4. Exploratory Data Analysis/Week 4 Project")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

baltimore <- NEI[NEI$fips == "24510", ]

library(plyr)
balt.table <- ddply(baltimore, ~year, summarise,
                    total.emissions = sum(Emissions))

# Plot 2: save
png(filename = "plot2.png", width = 480, height = 480)
plot(balt.table, main = "Total Emissions in Baltimore City, 1999 - 2008",
     xlab = "Year",
     ylab = "Total emissions from all sources (tons)",
     col = "red",
     pch = 19)
lines(balt.table$year, balt.table$total.emissions, col = "red")
dev.off()