#plot1
p1=read.table('household_power_consumption.txt', sep=";", header = TRUE, as.is = TRUE)
p1$Date=as.Date(p1$Date, '%d/ %m/ %Y')
p1=p1[p1$Date>="2007-02-01" & p1$Date<="2007-02-02",]
p1$Global_active_power=as.numeric(p1$Global_active_power)
png("plot1.png",height = 480, width = 480)
hist(as.numeric(p1$Global_active_power), 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red")
dev.off()