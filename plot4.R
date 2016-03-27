#Question 3 Create the following plot:
#Line plot of 3 elements between 01/02/20117-2/2/2007.
#Sub-metering 1, 2, and 3
#As in plot 2, time scale needs to change from #1/2/2012 to Thursday,...

#Set my working directy
setwd("~/Documents/Coursera/Data Spezialization/Exploratory data analysis/week 1/Assingment")

data1 <- "./household_power_consumption.txt"#Load Data
data2 <- read.table(data1, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings=c("?"))
subSetData2 <- data2[data2$Date %in% c("1/2/2007","2/2/2007") ,]

head(subSetData2)#First glimpse at household Power consumption
str(subSetData2)#Character file for Global_active_power


#Local time spanish
datetime <- strptime(paste(subSetData2$Date, subSetData2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subMetering1 <- as.numeric(subSetData2$Sub_metering_1)
subMetering2 <- as.numeric(subSetData2$Sub_metering_2)
subMetering3 <- as.numeric(subSetData2$Sub_metering_3)
globalActivePower <- as.numeric(subSetData2$Global_active_power)
globalReactivePower <- as.numeric(subSetData2$Global_reactive_power)



par(mfrow=c(2,2))#sets the space for a 2x2 (4 plots) clockwise from upper-left


plot(datetime, globalActivePower, type="l", ylab="Global Reactive Power [kW]", xlab="")#c(1,1) plot

plot(datetime, subSetData2$Voltage, type="l", ylab="Voltage [V]", xlab="")#c(1,2) plot

plot(datetime, subMetering1, type="l", ylab="Energy Submetering [W-hr]", xlab="")#c(2,1) plot
lines(datetime, subMetering2, type="l", col="red")#Add line sub_metering_2
lines(datetime, subMetering3, type="l", col="blue")#Add line sub_metering_3
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, globalReactivePower, type="l", ylab="Global Reactive Power [kW]", xlab="")#c(2,2) plot

dev.copy(png, file = "Plot4.png")#with graph opened in screen I can copy it (has 480x480 pixels already)
dev.off()



