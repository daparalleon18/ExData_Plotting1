# Loading the data
df_all <- read.table("household_power_consumption.txt", sep = ";", 
                     header = TRUE, stringsAsFactors = FALSE)
df <- df_all[df_all$Date %in% c("1/2/2007", "2/2/2007"),]
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Time <- as.POSIXlt(paste(df$Date, format(strptime(df$Time, format = "%H:%M:%S"), "%H:%M:%S")))

# Plot 2
png("plot2.png")

plot(df$Time, 
     df$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()
