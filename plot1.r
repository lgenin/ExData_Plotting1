### Histagram of Global Active Power.  Plot 1
setwd('C:\\Users\\Laura Genin\\Documents\\school\\Coursera\\Exploratory Data Analisys')
data<-read.csv('C:\\Users\\Laura Genin\\Documents\\school\\Coursera\\Exploratory Data Analisys\\household_power_consumption.csv.txt',sep=';',stringsAsFactors=FALSE)

data$Date<-as.Date(data$Date, format='%d/%m/%Y')

data_sub<-subset(data,Date == '2007-02-01' | Date=='2007-02-02')
data_sub$Global_active_power<-as.numeric(data_sub$Global_active_power)

png(file="plot1.png",width=480,height=480)
plot1<-hist(data_sub$Global_active_power,breaks=10,main='Global Active Power',col='red',xlab='Global Active Power (kw)')
dev.off()