library(readr)
setwd("~/R_Scripts/Programming_Examples/Analytics")
household_power_consumption <- read_delim("~/R_Scripts/Programming_Examples/Analytics/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE, na='?')
household_power_consumption$Date<-as.character.Date(household_power_consumption$Date)
household_power_consumption$Date<-trimws(household_power_consumption$Date)
data<-subset(household_power_consumption, (Date=="2/2/2007"|Date=="1/2/2007"))



png("plot3.png",width=480,height=480) 
with(data, plot(Sub_metering_1, col='black', type="l" ,lwd=2, xlab='', ylab='Energy Sub Metering',xaxt = "n"))
lines(data$Sub_metering_2, col='red',type="l" ,lwd=2)
lines(data$Sub_metering_3, col='blue',type="l" ,lwd=2)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), border="black",lty=c(1,1,1), lwd=c(2,2,2),col=c("black","red","blue"))
axis(side = 1, at = c(0,min(which(data$Date=="2/2/2007")),(nrow(data)+1)), labels = c("Thu", "Fri", "Sat"),xlab=NULL)
dev.off()