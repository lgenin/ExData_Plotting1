### Histagram of Global Active Power.  Plot 1
setwd('C:\\Users\\Laura Genin\\Documents\\school\\Coursera\\Exploratory Data Analisys')
data<-read.csv('C:\\Users\\Laura Genin\\Documents\\school\\Coursera\\Exploratory Data Analisys\\household_power_consumption.csv.txt',sep=';',stringsAsFactors=FALSE)

data$Date<-as.Date(data$Date, format='%d/%m/%Y')


data_sub<-subset(data,Date == '2007-02-01' | Date=='2007-02-02')

data_sub$day<-weekdays(as.Date(data_sub$Date))
data_sub$dateTime <- as.POSIXct(paste(data_sub$Date, data_sub$Time, format= "%Y-%m-%d %H:%M:%S"))


png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(data_sub$dateTime,data_sub$Global_active_power,type='l',main='Global Active Power over Time',
     ,ylab='Global Active Power (kw)',xlab='')

plot(data_sub$dateTime, data_sub$Voltage, type = "l", col='black',
            xlab = '', ylab = 'Voltage',main='Voltage over Time')


plot(data_sub$dateTime, data_sub$Sub_metering_1, type = "l", col='black',
     xlab = '', ylab = 'Energy sub metering(kw)',main='Sub Metering over Time')
+    lines(data_sub$dateTime, data_sub$Sub_metering_2, col = 'red', type = 'l')
+    lines(data_sub$dateTime, data_sub$Sub_metering_3, col = 'blue', type = 'l')
+    legend('topright', lty=1, col=c('black', 'red', 'blue'),
            legend=c('Sub-meter 1', 'Sub-meter 2', 'Sub-meter 3'))


plot(data_sub$dateTime, data_sub$Global_reactive_power, type = "l", col='black',
                   xlab = '', ylab = 'Reactive Power (kw)',main='Global Reactive Power over Time')


dev.off()