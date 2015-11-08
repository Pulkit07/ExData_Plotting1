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

##  Opening a connection to a graphic device i.e. png file named plot2.png
png("plot2.png");

##  Plotting the plot with required labels and plotting type i.e line.
plot(b$dt,b$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)");

##  Closing the connection.
dev.off();
