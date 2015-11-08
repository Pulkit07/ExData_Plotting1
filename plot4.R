#############################################################
##  Course Project 1
##  Exploratory Data Analysis
##  Coursera
##  Author- Pulkit Goyal
#############################################################

##  The folder is downloaded and file in unzipped in working directory as household_power_consumption.txt

##  Reading data from the text file
##  Setting separator as ";" and na.strings as "?".
a<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?");

##  Subsetting the required data.
b<-a[which(a$Date=='1/2/2007' | a$Date=='2/2/2007'),];

##  Creating a new variable which includes both date and time but using paste().
b$dt<-do.call(paste,c(b[c("Date","Time")],sep=" "));

##  Converting the new variable into date class using strptime().
b$dt<-strptime(b$dt,"%d/%m/%Y %H:%M:%S");

##  Opening a connection to a graphic device i.e. png file named plot4.png
png("plot4.png");

##  Changing the plot settings to plot 4 plots using par() and mfrow.
par(mfrow=c(2,2));

##  Plotting the first plot i.e. topleft one with required labels and plotting type i.e line.
with(b,plot(dt,Global_active_power,xlab="",ylab="Global Active Power",type="l"));

##  Plotting the second plot i.e. topright one with required labels and plotting type i.e line.
with(b,plot(dt,Voltage,xlab="datetime",ylab="Voltage",type="l"));

##  Plotting the third plot i.e. bottomleft one with required labels,colors and legend.
with(b,plot(dt,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"));
lines(b$dt,b$Sub_metering_2,col="red");
lines(b$dt,b$Sub_metering_3,col="blue");
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col=c('black','red','blue'));

##  Plotting the fourth plot i.e. bottomright one with required labels and plotting type i.e line.
with(b,plot(dt,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l"));

##  Closing the connection.
dev.off();
