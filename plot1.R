#getting data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subsetting data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 

#Plot 1
globalActivePower <- as.numeric(data$Global_active_power)
hist(data$Global_active_power,  col="Red", main="Global Active Power", xlab="Global Active Power (in kW)")

#Saving as png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


