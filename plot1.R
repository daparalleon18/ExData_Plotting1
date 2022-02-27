# Loading the data
df_all <- read.table("household_power_consumption.txt", sep = ";", 
                     header = TRUE, stringsAsFactors = FALSE)
df <- df_all[df_all$Date %in% c("1/2/2007", "2/2/2007"),]

# Plot 1
png("plot1.png")

hist(as.numeric(df$Global_active_power), 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.off()
