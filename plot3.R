setwd("~/R/EDA")

mydata <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrow=2880)

header <- read.table("household_power_consumption.txt",sep=";",nrow=1)

colnames(mydata) <- unlist(header)

mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")


png("plot3.png", height=480, width=480)

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
       col = c('black', 'red', 'blue'))




dev.off()
