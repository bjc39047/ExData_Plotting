makeChart2<-function() {

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

#chart2

	png("plot2.png",width = 480, height = 480)

	plot(dataSet$dt,dataSet$Global_active_power,
		type="l",
		xlab="",
		ylab="Global Active Power (kilowatts)")

	dev.off()

}