
library(lubridate)

#Read in data and truncate to desired dates
alldata <- read.delim("household_power_consumption.txt",sep = ";", 
                   na.strings = "?")
alldata$datetime<-dmy_hms(paste(alldata$Date,alldata$Time))
alldata$Date <- dmy(alldata$Date)

truncdata <- alldata[(alldata$Date=="2007-02-01"|alldata$Date=="2007-02-02"),]

#Establish graphing parameters
par(mfrow = c(1,1))
par(mar = c(4, 4, 2, 1))

#Create histogram plot
hist(truncdata$Global_active_power,col="red",main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)")

#Save copy as png file
dev.copy(png, file = "plot1.png", width =480, height = 480, res = 72)
dev.off()



