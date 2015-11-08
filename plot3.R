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

##  Opening a connection to a graphic device i.e. png file named plot3.png
png("plot3.png");

##  Plotting the plot with required labels and just one variable i.e. Sub_metering_1
with(b,plot(dt,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"));

##  Adding new variable Sub_metering_2 to plot using lines() with required color.
lines(b$dt,b$Sub_metering_2,col="red");

##  Adding new variable Sub_metering_3 to plot using lines() with required color.
lines(b$dt,b$Sub_metering_3,col="blue");

##  Adding the legend to the plot.
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col=c('black','red','blue'));

##  Closing the connection.
dev.off();
