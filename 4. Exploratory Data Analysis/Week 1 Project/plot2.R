# CJ Arayata
# Exploratory Data Analysis Assignment 1 - Graph 2

# load in feb.data
load("feb.data")

# Plot 2
png(filename = "plot2.png", width = 480, height = 480)
plot(x = feb.data$datetime, y = feb.data$Global_active_power, type = "n",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
lines(x = feb.data$datetime, y = feb.data$Global_active_power)
dev.off()