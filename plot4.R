setwd("~/R/EDA")

mydata <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrow=2880)

header <- read.table("household_power_consumption.txt",sep=";",nrow=1)

colnames(mydata) <- unlist(header)

mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")


# Open plot4.png
png("plot4.png", height=480, width=480)

# Configure multiplot
par(mfrow=c(2,2))

# Global Active Power plot
plot(mydata$DateTime, 
     mydata$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(mydata$DateTime, mydata$Global_active_power)

# Voltage plot
plot(mydata$DateTime, mydata$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(mydata$DateTime, mydata$Voltage)

# Submetering plot
plot(mydata$DateTime, 
     mydata$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")
lines(mydata$DateTime, mydata$Sub_metering_1)
lines(mydata$DateTime, mydata$Sub_metering_2, col='red')
lines(mydata$DateTime, mydata$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       bty = 'n')

# Global reactive power plot
with(mydata, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(mydata, lines(DateTime, Global_reactive_power))

# Close PNG file


dev.off()
