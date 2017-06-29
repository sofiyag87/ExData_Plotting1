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


# Step 2
# Making Plots

png(filename = "plot1.png", width = 480, height = 480, units = "px",bg = "white")
hist(as.numeric(data_selected$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frecuency", col="red")
dev.off()