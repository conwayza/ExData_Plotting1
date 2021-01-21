#getting data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

#subsetting data
subsetData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))  

dateTime <- strptime(paste(subsetData$Date, subsetData$Time), "%d/%m/%Y %H:%M:%S")
dateTime <- as.POSIXct(dateTime)
globalActivePower <- as.numeric(subsetData$Global_active_power)
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

#Creating the png
dev.copy(png, file="plot4.png", height=480, width=480)
par(mfrow = c(2,2))
attach(data)
plot(dateTime, Voltage, type="l")
plot(dateTime, subMetering1,  type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2,  type="l", col="Red")
lines(dateTime, subMetering3,  type="l", col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue"))

plot(dateTime, Global_reactive_power, type="l")

dev.off()
detach(data)

#For whomever is reviewing, I could not get the last 3 graphs to work due to the following error: 
#Error in plot.window(...) : need finite 'xlim' values
#In addition: Warning messages:
#The file's syntax made sense to me, however, I could not figure out how to get the 'xlim' value error to clear