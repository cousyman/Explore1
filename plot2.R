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

#Create plot2
png(file='plot2.png',width=480,height=480)

plot2 <- plot(data$datetime, data$Global_active_power, 
              type='l',
              xlab='',
              ylab='Global Active Power (kilowatts)')

dev.off()