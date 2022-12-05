makeChart3<-function() {

	setwd("C:/Users/clark/Downloads/")

	filename <- "household_power_consumption.zip"

## Download and unzip the dataset:

	if (!file.exists(filename)){
		fileURL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
		download.file(fileURL, filename)
	}  
	
	if (file.exists(filename)) { 
  		unzip(filename) 
	}

# read file

	rawData<-read.table("./household_power_consumption.txt",sep=";",header=FALSE,skip=1,stringsAsFactors=FALSE,dec=".")
	names(rawData)<-read.table("./household_power_consumption.txt",sep=";",nrows=1,stringsAsFactors=FALSE,dec=".")

#filter on date

	dataSet<-rawData[rawData$Date %in% c("1/2/2007","2/2/2007"),]
	dataSet$dt<-strptime(paste(trimws(dataSet$Date),trimws(dataSet$Time)),format="%d/%m/%Y %H:%M:%S")

#chart3

	png("plot3.png",width = 480, height = 480)
	
	plot(dataSet$dt,dataSet$Sub_metering_1,
		type="l",
		xlab="",
		ylab="Energy sub metering")

	lines(dataSet$dt,dataSet$Sub_metering_2,
		type="l",
		col="red")
	
	lines(dataSet$dt,dataSet$Sub_metering_3,
		type="l",
		col="blue")
	
	legend("topright",
		legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
		col=c("black","red","blue"),
		lty=1)

	dev.off()

}