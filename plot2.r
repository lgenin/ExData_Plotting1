### Global Active Power by date/time.  Plot 2

data<-read.csv('household_power_consumption.csv.txt',sep=';',stringsAsFactors=FALSE)

data$Date<-as.Date(data$Date, format='%d/%m/%Y')


data_sub<-subset(data,Date == '2007-02-01' | Date=='2007-02-02')

data_sub$day<-weekdays(as.Date(data_sub$Date))
data_sub$dateTime <- as.POSIXct(paste(data_sub$Date, data_sub$Time, format= "%Y-%m-%d %H:%M:%S"))

png(file="plot2.png",width=480,height=480)
plot(data_sub$dateTime,data_sub$Global_active_power,type='l' ,ylab='Global Active Power (kilowatts)',xlab='')
dev.off()