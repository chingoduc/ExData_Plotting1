library(data.table)
library(plyr)
library(dplyr)

cons <- data.table(read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                            colClasses = c("character", "character","numeric", "numeric", 
                                           "numeric", "numeric", "numeric", "numeric", "numeric")))
cons_feb <- filter(cons, {consdate <- as.Date(Date, format="%d/%m/%Y"); 
                       consdate==as.Date("2007-02-01") | consdate==as.Date("2007-02-02")})
png(file="plot4.png", height=480, width = 480)
par(mfcol = c(2, 2), oma = c(0, 0, 2, 0))
with(cons_feb, {
  plot(strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"), 
       Global_active_power, type="l", ylab="Global Active Power (kilowatts)",
       xlab="")
  plot(strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"),Sub_metering_1 , 
       type = "l", ylab = "Energy sub metering", xlab="", col="black")
  points(strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"),Sub_metering_2 , 
                       type="l",col = "red")
  points(strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"),Sub_metering_3 , 
                     type="l",col = "blue")
  legend("topright", pch = 95, col = c("black","red", "blue"), cex = 0.75,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"), 
     Voltage, type="l", ylab="Voltage",
     xlab="datetime")
  plot(strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"), 
     Global_reactive_power, type="l", xlab="datetime")
})
dev.off() 

 
