household_power_consumption <- read.csv("household_power_consumption.txt", sep=";",na.strings=c("?"))

household_power_consumption$Date_Time <- paste(as.character(household_power_consumption$Date),as.character(household_power_consumption$Time))

household_power_consumption$Date_Time <- strptime(household_power_consumption$Date_Time,format="%d/%m/%Y %H:%M:%S")

household_power_consumption <- household_power_consumption[which(household_power_consumption$Date_Time > as.POSIXlt('2007-02-01') & household_power_consumption$Date_Time < as.POSIXlt('2007-02-03')),]

#plot 1
png(filename="figure/plot1.png")
hist(household_power_consumption$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.off()