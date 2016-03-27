#Question 2. Create the following plot:
#Line plot of Global active power between 01/02/20117-2/2/2007, but the time scale needs to change from
#1/2/2012 to Thursday,...

#Set my working directy
setwd("~/Documents/Coursera/Data Spezialization/Exploratory data analysis/week 1/Assingment")

data1 <- "./household_power_consumption.txt"#Load Data
data2 <- read.table(data1, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings=c("?"))
subSetData2 <- data2[data2$Date %in% c("1/2/2007","2/2/2007") ,]

head(subSetData2)#First glimpse at household Power consumption
str(subSetData2)#Character file for Global_active_power


#Local time spanish
datetime <- strptime(paste(subSetData2$Date, subSetData2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData2$Global_active_power)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power [kW]")#First make the plot
dev.copy(png, file = "Plot2.png")#with graph opened in screen I can copy it (has 480x480 pixels already)
dev.off()



