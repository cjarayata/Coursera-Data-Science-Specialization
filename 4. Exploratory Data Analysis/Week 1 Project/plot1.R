# CJ Arayata
# Exploratory Data Analysis Assignment 1 - Graph 1

# Read in data and cut down to february after formatting
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = c("", "?"), header = T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
feb.data <- data[which(data$Date > '2007-01-31' & data$Date < '2007-02-03'), ]

# Create new variable for other plots
feb.data$datetime <- paste(feb.data$Date, feb.data$Time)
feb.data$datetime <- as.POSIXlt(feb.data$datetime)

# Save feb.data to use in other R files
save(feb.data, file = "feb.data")

# Plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(feb.data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()

