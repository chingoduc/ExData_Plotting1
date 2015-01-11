library(data.table)
library(plyr)
library(dplyr)

cons <- data.table(read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                            colClasses = c("character", "character","numeric", "numeric", 
                                           "numeric", "numeric", "numeric", "numeric", "numeric")))
cons_feb <- filter(cons, {consdate <- as.Date(Date, format="%d/%m/%Y"); 
                       consdate==as.Date("2007-02-01") | consdate==as.Date("2007-02-02")})
##png(file="plot2.png", height=480, width = 480)
with( cons2, plot(strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"), 
                Global_active_power, type="l", ylab="Global Active Power (kilowatts)",
                xlab=""))
dev.copy(png, file="plot2.png", height=480, width = 480 )
dev.off() 

 
