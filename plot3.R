#getting data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

#subsetting data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))  

dateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(data$Global_active_power)
subMetering1 <- 
