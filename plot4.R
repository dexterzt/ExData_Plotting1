#plot4
p1=read.table('household_power_consumption.txt', sep=";", header = TRUE, as.is = TRUE)
p1$Date=as.Date(p1$Date, '%d/ %m/ %Y')
p1=p1[p1$Date>="2007-02-01" & p1$Date<="2007-02-02",]
p1$Global_active_power=as.numeric(p1$Global_active_power)
p1$Voltage=as.numeric(p1$Voltage)
p1$Sub_metering_1=as.numeric(p1$Sub_metering_1)
p1$Sub_metering_2=as.numeric(p1$Sub_metering_2)
p1$Sub_metering_3=as.numeric(p1$Sub_metering_3)
p1$Global_reactive_power=as.numeric(p1$Global_reactive_power)
png("plot4.png",height = 480, width = 480)
par(mfrow=c(2,2))

#1
with(p1, {
  time <- strptime(paste(Date, Time),
                   "%Y-%m-%d %H:%M:%S")
  plot(time, Global_active_power, type = "l", 
       ylab = "Global Active Power", xlab=NA)
})

#2
with(p1, {
  time <- strptime(paste(Date, Time),
                   "%Y-%m-%d %H:%M:%S")
  plot(time, Voltage, type = "l", 
       ylab = "Voltage", xlab="datetime")
})

#3
with(p1, {
  time <- strptime(paste(Date, Time),
                   "%Y-%m-%d %H:%M:%S")
  plot(time, Sub_metering_1, type = "l", 
       ylab = "Energy sub metering", xlab=NA)
})

with(p1, {
  time <- strptime(paste(Date, Time),
                   "%Y-%m-%d %H:%M:%S")
  lines(time, Sub_metering_2, type = "l", 
        ylab = NA, xlab=NA, col="red")
})

with(p1, {
  time <- strptime(paste(Date, Time),
                   "%Y-%m-%d %H:%M:%S")
  lines(time, Sub_metering_3, type = "l", 
        ylab=NA, xlab=NA, col="blue")
})
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#4
with(p1, {
  time <- strptime(paste(Date, Time),
                   "%Y-%m-%d %H:%M:%S")
  plot(time, Global_reactive_power, type = "l", 
       ylab = "Global Reactive Power", xlab="datetime")
})
dev.off()
