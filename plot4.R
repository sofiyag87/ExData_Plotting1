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

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2, 2)) 
plot(date_time,as.numeric(data_selected$Global_active_power), xlab=" ", ylab="Global Active Power",type="l")
plot(date_time,as.numeric(data_selected$Voltage), xlab="datetime", ylab="Voltage",type="l")
plot(date_time, as.numeric(data_selected$Sub_metering_1),type="l", col="black", xlab=" ", ylab="Energy sub metering")
lines(date_time, as.numeric(data_selected$Sub_metering_2),type="l",col="red")
lines(date_time, as.numeric(data_selected$Sub_metering_3),type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(date_time,as.numeric(data_selected$Global_reactive_power), xlab="datetime", ylab="Global_Reactive_Power",type="l")

dev.off()







    