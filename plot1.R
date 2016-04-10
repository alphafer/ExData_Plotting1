# Download file and set data if it is not ready yet
if(!exists("epc")){
  source('loadData.R')
}

# Open PNG device
png(file="plot1.png", 
    width=480, 
    height=480, 
    bg="transparent")

# Plot!
hist(epc$Global_active_power,
     xlab="Global Active Powder (killowatts)",
     main="Global Active Power",
     col="red")

# Close device
dev.off()