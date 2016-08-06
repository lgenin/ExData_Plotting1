

data<-read.csv('C:\\Users\\akyrala\\Documents\\R\\R coursework\\household_power_consumption.txt',sep=';',stringsAsFactors=FALSE)

data$Date<-as.Date(data$Date, format='%d/%m/%Y')

data_sub<-subset(data,Date == '2007-01-01' | Date=='2007-01-02')
data_sub$Global_active_power<-as.numeric(data_sub$Global_active_power)

plot1<-hist(data_sub$Global_active_power,breaks=10,main='Plot1',col='red')

png(file="plot1.png",width=480,height=480)
hist(data_sub$Global_active_power,breaks=10,main='Plot1',col='red')
dev.off()