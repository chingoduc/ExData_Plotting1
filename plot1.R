library(data.table)
library(plyr)
library(dplyr)


cons <- data.table(read.csv("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                            colClasses = c("character", "character","numeric", "numeric", 
                                           "numeric", "numeric", "numeric", "numeric", "numeric")))
cons_feb <- filter(cons, {consdate <- as.Date(Date, format="%d/%m/%Y"); 
                       consdate==as.Date("2007-02-01") | consdate==as.Date("2007-02-02")})

##png(file="plot1.png", height=480, width = 480)

with(cons2, hist(Global_active_power, freq=TRUE, col= "red", 
                             main="Global Active Power",
                             xlab= "Global Active Power (kilowatts)", ylab= "Frequency"))
dev.copy(png, file="plot1.png", height=480, width = 480 )
dev.off() 