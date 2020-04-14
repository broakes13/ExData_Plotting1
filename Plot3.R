
library(lubridate)

#Read in data and truncate to desired dates
alldata <- read.delim("household_power_consumption.txt",sep = ";", 
                   na.strings = "?")
alldata$datetime<-dmy_hms(paste(alldata$Date,alldata$Time))
alldata$Date <- dmy(alldata$Date)

truncdata <- alldata[(alldata$Date=="2007-02-01"|alldata$Date=="2007-02-02"),]

#Establish graphing parameters
par(mar = c(3, 4, 2, 1))

#Create empty plot background and fill with desired traces
plot(truncdata$datetime,truncdata$Sub_metering_1, type = "n",
                    ylab = "Energy sub meeting")
lines(truncdata$datetime,truncdata$Sub_metering_1, type = "l",
                    col = "black")
lines(truncdata$datetime,truncdata$Sub_metering_2, type = "l",
      col = "red")
lines(truncdata$datetime,truncdata$Sub_metering_3, type = "l",
      col = "blue")

#Create legend
legtext = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend = legtext, lty = 1, col = c("black", "red", "blue"))

#Save copy as png file
dev.copy(png, file = "plot3.png", width =480, height = 480, res = 72)
dev.off()



