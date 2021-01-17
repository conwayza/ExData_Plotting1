#getting data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subsetting data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 

#Plot 2
dateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(data$Global_active_power)
plot(globalActivePower ~ dateTime,  type="l", main="Global Active Power", xlab="", ylab="Global Active Power")

#Saving as png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
