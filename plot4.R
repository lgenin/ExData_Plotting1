### Histagram of Global Active Power.  Plot 4

data<-read.csv('household_power_consumption.csv.txt',sep=';',stringsAsFactors=FALSE)

data$Date<-as.Date(data$Date, format='%d/%m/%Y')


data_sub<-subset(data,Date == '2007-02-01' | Date=='2007-02-02')

data_sub$day<-weekdays(as.Date(data_sub$Date))
data_sub$dateTime <- as.POSIXct(paste(data_sub$Date, data_sub$Time, format= "%Y-%m-%d %H:%M:%S"))


png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(data_sub$dateTime,data_sub$Global_active_power,type='l',ylab='Global Active Power',xlab='')

plot(data_sub$dateTime, data_sub$Voltage, type = "l", col='black',
            xlab = 'datetime', ylab = 'Voltage')

plot(data_sub$dateTime, data_sub$Sub_metering_1, type = "l", col='black',
     xlab = '', ylab = 'Energy sub metering')
+    lines(data_sub$dateTime, data_sub$Sub_metering_2, col = 'red', type = 'l')
+    lines(data_sub$dateTime, data_sub$Sub_metering_3, col = 'blue', type = 'l')
+    legend('topright', lty=1, col=c('black', 'red', 'blue'),
            legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))


plot(data_sub$dateTime, data_sub$Global_reactive_power, type = "l", col='black',ylab='Gloabal_reactive_power',xlab='datetime')


dev.off()