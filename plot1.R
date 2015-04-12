setwd("~/R/EDA")

mydata <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrow=2880)

header <- read.table("household_power_consumption.txt",sep=";",nrow=1)

colnames(mydata) <- unlist(header)

mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")

png("plot1.png", height=480, width=480)

hist(mydata$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')


dev.off()
