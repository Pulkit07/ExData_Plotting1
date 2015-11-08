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

##  Converting date variable to date class.
a$Date<-as.Date(a$Date,"%d/%m/%Y");

##  Extarcting the subset required.
b<-a[which(a$Date=="2007-02-01" | a$Date=="2007-02-02"),];

##  Opening a connection to a graphic device i.e. png file named plot1.png
png("plot1.png");

##  Plotting the histogram with required labels and color.
hist(b$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power");

##  Closing the connection.
dev.off();
