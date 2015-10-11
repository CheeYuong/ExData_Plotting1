setwd('C:/Users/user/Desktop/datascience/ExploratoryDataAnalysis')
getwd()
unzip("exdata-data-household_power_consumption.zip",exdir="Household Power Consumption")
# Data path
path <- 'C:/Users/user/Desktop/datascience/ExploratoryDataAnalysis/Household Power Consumption'
Full_Data <- read.table(file.path(path, "household_power_consumption.txt"),header =TRUE, sep = ";",na.strings = "?")
head(Full_Data)
str(Full_Data)
subset_date<- Full_Data[Full_Data$Date %in% c("1/2/2007","2/2/2007"),]
str(subset_date)
head(subset_date)
subset_DateTime <-strptime(paste(subset_date$Date, subset_date$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
str(subset_DateTime)
Final_Data <- cbind(subset_DateTime, subset_date)
#Plot 3
png(file = "plot3.png", width = 480, height=480, type="windows") 
labels<- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(Final_Data$subset_DateTime,Final_Data$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(Final_Data$subset_DateTime,Final_Data$Sub_metering_2,col="red")
lines(Final_Data$subset_DateTime,Final_Data$Sub_metering_3,col="blue")
legend("topright", legend=labels,col=c("black","red","blue"),pch = "-")
dev.off()