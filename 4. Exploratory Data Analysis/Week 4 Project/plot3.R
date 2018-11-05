setwd("C:/Users/carayata/Desktop/datasciencecoursera/4. Exploratory Data Analysis/Week 4 Project")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

baltimore <- NEI[NEI$fips == "24510", ]

library(ggplot2)
library(plyr)

balt.table <- ddply(baltimore, .(year, type), summarise,
                    total.emissions = sum(Emissions))

# Plot 3: save
png(filename = "plot3.png", width = 800, height = 480)
ggplot(balt.table, aes(x = year, y = total.emissions, colour = type)) +
        geom_point() +
        geom_line() +
        ggtitle("Emissions by Type in Baltimore City, 1999 - 2008") +
        labs(x = "Year", y = "Total Emissions (Tons)") +
        theme_bw()
dev.off()
