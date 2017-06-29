fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
directory<-("data.zip")
download.file(fileUrl,directory)
unzip(directory)


# Step 1
# Loading data

# calculating size of data

data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
object_size(data)
#the data needs 150 MB

# select dates: 2007-02-01; 2007-02-02
data_selected <-data[data$Date %in% c("1/2/2007","2/2/2007") ,]
date_time <- strptime(paste(data_selected$Date, data_selected$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 



# Step 2
# Making Plots

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(date_time,as.numeric(data_selected$Global_active_power), xlab=" ", ylab="Global Active Power (kilowatts)",type="l")
dev.off()







    