#getting data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, sep=";", skip=1, dec=".")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subsetting data
subdata <- subset(data, subset=(data$Date=="1/2/2007" | data$Date=="2/2/2007")) 
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:S%")
subdata[1:1440, "Time"] <- format(subdata[1:1440, "Time"], "2007-02-01 %H:%M:S%")
subdata[1441:2880, "Time"] <- format(subdata[1441:2880, "Time"], "2007-02-01 %H:%M:S%")

#Plotting and saving the data 
dev.copy(png, file="plot2.png", height=480, width=480)
plot(subdata$Time, as.numeric(as.character(subdata$Global_active_power)), type="l", xlab="", ylab="Global Active Power (In KW)")
dev.off()



