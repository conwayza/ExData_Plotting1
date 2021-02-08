##Collecting the information from the text file and creating a subset for it
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetDataFile <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

##Creating variables to construct the desired plot
dateTime <- strptime(paste(subsetDataFile$Date, subsetDataFile$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsetDataFile$Global_active_power)
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

attach(data)
dev.copy(png, file="plot3.png", height=480, width=480)
plot(dateTime, subMetering1,  type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2,  type="l", col="Red")
lines(dateTime, subMetering3,  type="l", col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 
dev.off()
