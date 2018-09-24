setwd("~/R/exploratory-data-analysis/Project1")

ds1<-read.csv2('household_power_consumption.txt')

ds1[][3]<-as.numeric(ds1$Global_active_power )


ds1$Date<-as.Date(ds1$Date, format="%d/%m/%Y")

help("subset.data.frame")

sub1<-subset.data.frame(ds1,Date >= "2007-02-01" & Date <= "2007-02-02")

sub1$Data <- as.POSIXct(paste(sub1$Date,sub1$Time))
plot.new()

png('plot1.png')

hist(sub1$Global_active_power, col='red', border='black' , plot = TRUE, main='Global Active Power', xlab='Global Active Power (kilowatts)', xaxt='n')
axis(side=1, at=seq(0,8000, by=1000), labels = seq(0,8, by=1))


dev.off()