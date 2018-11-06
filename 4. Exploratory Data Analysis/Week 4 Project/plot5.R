setwd("C:/Users/carayata/Desktop/datasciencecoursera/4. Exploratory Data Analysis/Week 4 Project")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

baltimore <- NEI[NEI$fips == "24510", ]

library(tidyverse)
library(magrittr)
library(plyr)
library(dplyr)

# Let's assume that by motor vehicles, they meant highway vehicles
hwy <- SCC %>% 
        filter(str_detect(SCC.Level.Two, "Highway Vehicles"))

# Get the target codes
hwy.codes <- as.character(hwy$SCC)

# Subset to just coal-combustion
hwy.NEI <- baltimore[baltimore$SCC %in% hwy.codes, ]

# Create summary table
hwy.table <- ddply(hwy.NEI, ~year, summarise,
                    total.emissions = sum(Emissions))

# Plot 5
png(filename = "plot5.png", width = 800, height = 480)
ggplot(hwy.table, aes(x = year, y = total.emissions)) +
        geom_point() +
        geom_line() +
        ggtitle("Motor Vehicle Emissions in Baltimore City, 1999 - 2008") +
        labs(x = "Year", y = "Total Emissions (Tons)") +
        theme_bw()
dev.off()