# CJ Arayata
# Exploratory Data Analysis Assignment 1 - Graph 4

# load in feb.data
load("feb.data")

# Plot 4

# Open file device
png(filename = "plot4.png", width = 480, height = 480)

# 2x2 matrix
par(mfrow = c(2, 2))

# Plot 1
plot(x = feb.data$datetime, y = feb.data$Global_active_power, type = "n",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
lines(x = feb.data$datetime, y = feb.data$Global_active_power)

# Plot 2
plot(x = feb.data$datetime, y = feb.data$Voltage, type = "n",
     xlab = "datetime",
     ylab = "Voltage")
lines(x = feb.data$datetime, y = feb.data$Voltage)

# plot 3
plot(x = feb.data$datetime, y = feb.data$Sub_metering_1, type = "n",
     xlab = "",
     ylab = "Energy sub metering")
lines(x = feb.data$datetime, y = feb.data$Sub_metering_1, col = "black")
lines(x = feb.data$datetime, y = feb.data$Sub_metering_2, col = "red")
lines(x = feb.data$datetime, y = feb.data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

# Plot 4
plot(x = feb.data$datetime, y = feb.data$Global_reactive_power, type = "n",
     xlab = "datetime",
     ylab = "Global Reactive Power")
lines(x = feb.data$datetime, y = feb.data$Global_reactive_power)

dev.off()