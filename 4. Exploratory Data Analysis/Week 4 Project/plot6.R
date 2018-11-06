setwd("C:/Users/carayata/Desktop/datasciencecoursera/4. Exploratory Data Analysis/Week 4 Project")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?

baltimore <- NEI[NEI$fips == "24510", ]
la <- NEI[NEI$fips == "06037", ]

library(tidyverse)
library(magrittr)
library(plyr)
library(dplyr)

# Let's assume that by motor vehicles, they meant highway vehicles
hwy <- SCC %>% 
        filter(str_detect(SCC.Level.Two, "Highway Vehicles"))

# Get the target codes
hwy.codes <- as.character(hwy$SCC)

# Subset to just highway vehicles
hwy.balt <- baltimore[baltimore$SCC %in% hwy.codes, ]
hwy.la <- la[la$SCC %in% hwy.codes, ]

# Create summary table
balt.table <- ddply(hwy.balt, ~year, summarise,
                   total.emissions = sum(Emissions))

la.table <- ddply(hwy.la, ~year, summarise,
                    total.emissions = sum(Emissions))

# Plot 6

library(gridExtra)

png(filename = "plot6.png", width = 1200, height = 480)

plot1 <- ggplot(balt.table, aes(x = year, y = total.emissions)) +
        geom_point() +
        geom_line() +
        ggtitle("Motor Vehicle Emissions in Baltimore City, 1999 - 2008") +
        labs(x = "Year", y = "Total Emissions (Tons)") +
        theme_bw() +
        geom_text(aes(label = round(total.emissions, 0)), vjust = -1) +
        annotate("text", x = 2002, y = 300, label = paste0("2008 emissions as proportion of 1999 emissions:\n", round(balt.table$total.emissions[4]/balt.table$total.emissions[1], 2)))

plot2 <- ggplot(la.table, aes(x = year, y = total.emissions)) +
        geom_point() +
        geom_line() +
        ggtitle("Motor Vehicle Emissions in Los Angeles County, 1999 - 2008") +
        labs(x = "Year", y = "Total Emissions (Tons)") +
        theme_bw() +
        geom_text(aes(label = round(total.emissions, 0)), vjust = -1) +
        annotate("text", x = 2005, y = 4200, label = paste0("2008 emissions as proportion of 1999 emissions:\n", round(la.table$total.emissions[4]/la.table$total.emissions[1], 2)))

grid.arrange(plot1, plot2, ncol = 2)
dev.off()