#plot2
p1=read.table('household_power_consumption.txt', sep=";", header = TRUE, as.is = TRUE)
p1$Date=as.Date(p1$Date, '%d/ %m/ %Y')
p1=p1[p1$Date>="2007-02-01" & p1$Date<="2007-02-02",]
p1$Global_active_power=as.numeric(p1$Global_active_power)
png("plot2.png",height = 480, width = 480)
with(p1, {
  time <- strptime(paste(Date, Time),
                   "%Y-%m-%d %H:%M:%S")
  plot(time, Global_active_power, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab=NA)
})
dev.off()