# CJ Arayata
# Exploratory Data Analysis Assignment 1 - Graph 3

# load in feb.data
load("feb.data")

# Plot 3
png(filename = "plot3.png", width = 480, height = 480)
plot(x = feb.data$datetime, y = feb.data$Sub_metering_1, type = "n",
     xlab = "",
     ylab = "Energy sub metering")
lines(x = feb.data$datetime, y = feb.data$Sub_metering_1, col = "black")
lines(x = feb.data$datetime, y = feb.data$Sub_metering_2, col = "red")
lines(x = feb.data$datetime, y = feb.data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
dev.off()