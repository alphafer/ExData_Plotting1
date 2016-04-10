# Download the data if file does not already exists
if (!file.exists("data.zip")) {
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="data.zip",
              method="curl")
#Unzip file
unzip (zipfile="data.zip")
}

# Read all txt file in a table
epc <- read.table("household_power_consumption.txt",
                   header= TRUE,
                   sep = ";",
                   na.string="?")

# extract
epc <- subset(epc, 
              Date=="1/2/2007" | Date=="2/2/2007")
