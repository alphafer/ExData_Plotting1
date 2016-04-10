if(!exists("epc")){
  source('loadData.R')
}

# adjust date
date <- as.character(as.Date(epc$Date, "%d/%m/%Y"))
x <- paste(date, epc$Time)

dateTime <- strptime(x,"%Y-%m-%d %H:%M:%S")

# Open PNG device
png(file="plot3.png", 
    width=480, 
    height=480, 
    bg="transparent")

# Plot!
plot(dateTime, 
     as.numeric(epc$Sub_metering_1), 
     type="l",
     ylab="Energy Submetering", 
     xlab="")

lines(dateTime, 
      as.numeric(epc$Sub_metering_2), 
      type="l", 
      col="red")

lines(dateTime, 
      as.numeric(epc$Sub_metering_3), 
      type="l", 
      col="blue")

legend("topright", 
       c("Sub_metering_1", 
         "Sub_metering_2", 
         "Sub_metering_3"), 
       lty=1, 
       lwd =2.5,
       col=c("black", "red", "blue")
       )

# Close device
dev.off()
