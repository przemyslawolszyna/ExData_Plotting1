setwd("~/R/exploratory-data-analysis/Project1")

ds1<-read.csv2('household_power_consumption.txt')

ds1[][3]<-as.numeric(ds1$Global_active_power )


ds1$Date<-as.Date(ds1$Date, format="%d/%m/%Y")

help("subset.data.frame")

sub1<-subset.data.frame(ds1,Date >= "2007-02-01" & Date <= "2007-02-02")

sub1$Data <- as.POSIXct(paste(sub1$Date,sub1$Time))
plot.new()
png('plot3.png')

with(sub1, {
  plot( Data,sub1$Sub_metering_1,type="l", ylim=c(0,35) ,  ylab="Energy sub metering", xlab="", yaxt='n' )
  at.val = seq(0,30,by=10)
  axis(side=2, at=at.val,labels =at.val)
  
  lines(Data, sub1$Sub_metering_2, type='l', col ='red')
  lines(Data, sub1$Sub_metering_3, type='l', col ='blue')
  legend(x="topright", y=c('Sub_metering_1,','Sub_metering_2','Sub_metering_3'), legend =c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'), lty = c(1,1,1) )
})
dev.off()

