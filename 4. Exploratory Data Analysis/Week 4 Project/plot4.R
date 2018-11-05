setwd("C:/Users/carayata/Desktop/datasciencecoursera/4. Exploratory Data Analysis/Week 4 Project")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# subset to just coal combustion

library(tidyverse)
library(magrittr)

# Levels one and three seem to be the most helpful here
coal <- SCC %>% 
        filter(str_detect(SCC.Level.One, "combustion|Combustion")) %>% 
        filter(str_detect(SCC.Level.Three, "coal|Coal"))

# Get the target codes
coal.codes <- as.character(coal$SCC)

# Subset to just coal-combustion
coal.NEI <- NEI[NEI$SCC %in% coal.codes, ]

# Create summary table
coal.table <- ddply(coal.NEI, ~year, summarise,
                    total.emissions = sum(Emissions))

# Plot 4
png(filename = "plot4.png", width = 800, height = 480)
ggplot(coal.table, aes(x = year, y = total.emissions)) +
        geom_point() +
        geom_line() +
        ggtitle("Coal-combustion Emissions in the United States, 1999 - 2008") +
        labs(x = "Year", y = "Total Emissions (Tons)") +
        theme_bw()
dev.off()