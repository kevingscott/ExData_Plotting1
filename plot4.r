household_power_consumption <- read.csv("household_power_consumption.txt", sep=";",na.strings=c("?"))

household_power_consumption$Date_Time <- paste(as.character(household_power_consumption$Date),as.character(household_power_consumption$Time))

household_power_consumption$Date_Time <- strptime(household_power_consumption$Date_Time,format="%d/%m/%Y %H:%M:%S")

household_power_consumption <- household_power_consumption[which(household_power_consumption$Date_Time > as.POSIXlt('2007-02-01') & household_power_consumption$Date_Time < as.POSIXlt('2007-02-03')),]


#plot 4
png(filename="figure/plot4.png")
par(mfrow=c(2,2))
plot(household_power_consumption$Date_Time,household_power_consumption$Global_active_power,type="l",ylab="Global Active Power",xlab="",)

plot(household_power_consumption$Date_Time,household_power_consumption$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(household_power_consumption$Date_Time,household_power_consumption$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",)
lines(household_power_consumption$Date_Time,household_power_consumption$Sub_metering_2,type="l",col="red")
lines(household_power_consumption$Date_Time,household_power_consumption$Sub_metering_3,type="l",col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,seg.len=2,cex=1,bty="n")

plot(household_power_consumption$Date_Time,household_power_consumption$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()