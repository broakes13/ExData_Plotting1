
library(lubridate)

#Read in data and truncate to desired dates
alldata <- read.delim("household_power_consumption.txt",sep = ";", 
                   na.strings = "?")
alldata$datetime<-dmy_hms(paste(alldata$Date,alldata$Time))
alldata$Date <- dmy(alldata$Date)

truncdata <- alldata[(alldata$Date=="2007-02-01"|alldata$Date=="2007-02-02"),]

#Establish graphing parameters
par(mfrow = c(2,2))
par(mar = c(4, 4, 2, 1))

#Create grid of plots
plot(truncdata$datetime,truncdata$Global_active_power, type = "l",
                    ylab = "Global Active Power", xlab = " ", col = "black")

plot(truncdata$datetime,truncdata$Voltage, type = "l",
                    ylab = "Voltage", xlab = "datetime", col = "black")

plot(truncdata$datetime,truncdata$Sub_metering_1, type = "n",
     ylab = "Energy sub meeting", xlab = " ")
lines(truncdata$datetime,truncdata$Sub_metering_1, type = "l",
      col = "black")
lines(truncdata$datetime,truncdata$Sub_metering_2, type = "l",
      col = "red")
lines(truncdata$datetime,truncdata$Sub_metering_3, type = "l",
      col = "blue")

legtext = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

legend("topright", legend = legtext, lty = 1, col = c("black", "red", "blue"),
       pt.cex = 1, cex = 0.5)

plot(truncdata$datetime,truncdata$Global_reactive_power, type = "l",
      col = "black", ylab = "Global_reactive_power", xlab = "datetime")

#Save copy as png file
dev.copy(png, file = "plot4.png", width =480, height = 480, res = 72)
dev.off()



