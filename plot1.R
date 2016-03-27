#Question 1. Create the following plot:
#Histogram of the Global active power between 01/02/20117-2/2/2007

#Set my working directy
setwd("~/Documents/Coursera/Data Spezialization/Exploratory data analysis/week 1/Assingment")

data1 <- "./household_power_consumption.txt"#Load Data
data2 <- read.table(data1, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData2 <- data2[data2$Date %in% c("1/2/2007","2/2/2007") ,]

head(subSetData2)#First glimpse at household Power consumption
str(subSetData2)#Character file for Global_active_power

globalActivePower <- as.numeric(subSetData2$Global_active_power)#Change it into numeric

#First make the plot
hist(globalActivePower, col="red", main="Global Active Power 01-02/02/2007", xlab="Global Active Power [kW]")

dev.copy(png, file = "Plot1.png")#with graph opened in screen I can copy it (has 480x480 pixels already)
dev.off()


