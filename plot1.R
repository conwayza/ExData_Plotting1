#getting data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors="?", nrows=2075259, check.names="?", commet.char="", quot='\"', dec=".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subsetting data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(data)

#Converting dates
dateTime <- paste(as.Date(data$Date), data$Time)
data$DateTime <- as.POSIXct(dateTime)

#Plot 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (in kW)", col="Red")

#Saving as png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


