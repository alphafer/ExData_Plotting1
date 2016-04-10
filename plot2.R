if(!exists("epc")){
  source('loadData.R')
}

# adjust date
date <- as.character(as.Date(epc$Date, "%d/%m/%Y"))
x <- paste(date, epc$Time)

dateTime <- strptime(x,"%Y-%m-%d %H:%M:%S")


# Open PNG device
png(file="plot2.png", 
    width=480, 
    height=480, 
    bg="transparent")

#Plot!
plot(dateTime, 
     as.numeric(epc$Global_active_power), 
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")

# Close device
dev.off()

