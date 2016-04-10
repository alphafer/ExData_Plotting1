if(!exists("epc")){
  source('loadData.R')
}

# adjust date
date <- as.character(as.Date(epc$Date, "%d/%m/%Y"))
x <- paste(date, epc$Time)

dateTime <- strptime(x,"%Y-%m-%d %H:%M:%S")

# Open PNG device
png(file="plot4.png", 
    width=480, 
    height=480, 
    bg="transparent")


# Set canvas
par(mfrow = c(2, 2))

# Plot!
with (epc, {
      plot(dateTime, 
           as.numeric(Global_active_power), 
           type="l",
           ylab="Global Active Power", 
           xlab="", 
           cex=0.2)

      plot(dateTime, 
           as.numeric(Voltage), 
           type="l",
           ylab="Voltage", 
           xlab="datetime")
      
      plot(dateTime, 
           as.numeric(Sub_metering_1),
           type="l",
           ylab="Energy Submetering", 
           xlab="")
      
      lines(dateTime, 
            as.numeric(Sub_metering_2), 
            type="l", 
            col="red")
      
      lines(dateTime, 
            as.numeric(Sub_metering_3), 
            type="l", 
            col="blue")
      
      legend("topright", 
             c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
             lty=1, 
             lwd =2.5,
             col=c("black", "red", "blue"), 
             bty = "n")
      
      plot(dateTime, 
           as.numeric(Global_reactive_power), 
           type="l", 
           xlab="datetime",
           ylab="Global_reactive_power")
      
     })


# Close device
dev.off()
