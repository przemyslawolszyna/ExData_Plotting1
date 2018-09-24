setwd("~/R/exploratory-data-analysis/Project1")

ds1<-read.csv2('household_power_consumption.txt')

ds1[][3]<-as.numeric(ds1$Global_active_power )


ds1$Date<-as.Date(ds1$Date, format="%d/%m/%Y")

help("subset.data.frame")

sub1<-subset.data.frame(ds1,Date >= "2007-02-01" & Date <= "2007-02-02")

sub1$Data <- as.POSIXct(paste(sub1$Date,sub1$Time))
plot.new()
png('plot2.png')

plot( sub1$Data,sub1$Global_active_power,type="l", ylab="Global Active  Power (kilowatts)", xlab="")

dev.off()

