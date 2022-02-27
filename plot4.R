# Loading the data
df_all <- read.table("household_power_consumption.txt", sep = ";", 
                     header = TRUE, stringsAsFactors = FALSE)
df <- df_all[df_all$Date %in% c("1/2/2007", "2/2/2007"),]
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Time <- as.POSIXlt(paste(df$Date, format(strptime(df$Time, format = "%H:%M:%S"), "%H:%M:%S")))


# Plot 4
png("plot4.png")

par(mfrow = c(2,2))

plot(df$Time, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(df$Time, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(df$Time, df$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(df$Time, df$Sub_metering_1, col = "black")
lines(df$Time, df$Sub_metering_2, col = "red")
lines(df$Time, df$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), cex = 0.3)
plot(df$Time, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
