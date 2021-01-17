#getting data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

#subsetting data
subsetData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))  

dateTime <- strptime(paste(subsetData$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsetData$Global_active_power)
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

dev.copy(png, file="plot3.png", height=480, width=480)
plot(dateTime, subMetering1,  type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2,  type="l", col="Red")
lines(dateTime, subMetering3,  type="l", col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 
dev.off()
