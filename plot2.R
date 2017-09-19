library(readr)
setwd("~/R_Scripts/Programming_Examples/Analytics")
household_power_consumption <- read_delim("~/R_Scripts/Programming_Examples/Analytics/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE, na='?')
household_power_consumption$Date<-as.character.Date(household_power_consumption$Date)
household_power_consumption$Date<-trimws(household_power_consumption$Date)
data<-subset(household_power_consumption, (Date=="2/2/2007"|Date=="1/2/2007"))



png("plot2.png",width=480,height=480) 
with(data, plot(Global_active_power, col='black', type="l" ,lwd=2, xlab='', ylab='Global Active Power (kilowatts)',xaxt = "n"))
axis(side = 1, at = c(0,min(which(data$Date=="2/2/2007")),(nrow(data)+1)), labels = c("Thu", "Fri", "Sat"))
dev.off()