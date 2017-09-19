library(readr)
setwd("~/R_Scripts/Programming_Examples/Analytics")
household_power_consumption <- read_delim("~/R_Scripts/Programming_Examples/Analytics/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE, na='?')
household_power_consumption$Date<-as.character.Date(household_power_consumption$Date)
household_power_consumption$Date<-trimws(household_power_consumption$Date)
data<-subset(household_power_consumption, (Date=="2/2/2007"|Date=="1/2/2007"))



png("plot4.png",width=480,height=480) 

par(mfrow=c(2,2))

#plot1
with(data, plot(Global_active_power, col='black', type="l" ,lwd=2, xlab='', ylab='Global Active Power (kilowatts)',xaxt = "n"))
axis(side = 1, at = c(0,min(which(data$Date=="2/2/2007")),(nrow(data)+1)), labels = c("Thu", "Fri", "Sat"))


#plot2
with(data, plot(Voltage, col='black', type="l" ,lwd=2, xlab='datetime', ylab='Voltage',xaxt = "n"))
axis(side = 1, at = c(0,min(which(data$Date=="2/2/2007")),(nrow(data)+1)), labels = c("Thu", "Fri", "Sat"))

#plot3
with(data, plot(Sub_metering_1, col='black', type="l" ,lwd=2, xlab='', ylab='Energy Sub Metering',xaxt = "n"))
lines(data$Sub_metering_2, col='red',type="l" ,lwd=2)
lines(data$Sub_metering_3, col='blue',type="l" ,lwd=2)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), border="black",lty=c(1,1,1), lwd=c(2,2,2),col=c("black","red","blue"))
axis(side = 1, at = c(0,min(which(data$Date=="2/2/2007")),(nrow(data)+1)), labels = c("Thu", "Fri", "Sat"),xlab=NULL)


#plot4
with(data, plot(Global_reactive_power, col='black', type="l" ,lwd=2, xlab='datetime', ylab='Global_reactive_power',xaxt = "n"))
axis(side = 1, at = c(0,min(which(data$Date=="2/2/2007")),(nrow(data)+1)), labels = c("Thu", "Fri", "Sat"))


dev.off()