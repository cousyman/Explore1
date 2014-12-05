#This code will create the first required plot.

#Load the data in.
household_power_consumption <- read.csv("S:/Mitchell/Decos/exdata-data-household_power_consumption/household_power_consumption.txt",
                                        sep=";", quote="", na.strings="?")

#Subset the data to use the proper dates only
data <- subset(household_power_consumption, 
               Date=='1/2/2007' | Date=='2/2/2007')

#Create a variable combining both date and time                                
data$datetime <- paste(data$Date, data$Time, sep = ' ')
#Make this variable the proper class in R.
data$datetime <- strptime(data$datetime, '%d/%m/%Y %H:%M:%S')

#Create plot3
png(file='plot3.png',width=480,height=480)

plot3 <- with(data, plot(datetime,Sub_metering_1, 
                         type='l', 
                         col='black',
                         xlab='', 
                         ylab='Energy sub metering'))

with(data, lines(datetime, Sub_metering_2, 
                 type='l', 
                 col='red'))
with(data, lines(datetime, Sub_metering_3, 
                 type='l', 
                 col='blue'))
legend('topright',
       lty=c(1,1), 
       lwd=c(2.5,2.5,2.5),
       col=c('black','red','blue'),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

dev.off()