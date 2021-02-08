##Collecting the information from the text file and creating a subset for it
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetDataFile <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

##Creating variables to construct the desired plot
dateTime <- strptime(paste(subsetDataFile$Date, subsetDataFile$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsetDataFile$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type='l', xlab="", ylab="Global Active Power (in Kw)")
dev.off()
