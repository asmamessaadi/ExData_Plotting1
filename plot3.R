#Author: ASMA MESSAADI
#After downloading the data, make sure that my data exists in my currrent directory
list.files()
#Read data into a table
data<- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
#Convert the date into Date class form
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#Subset data based on the date giving in the assignment
subset_data <- subset(data, as.Date(Date) >= as.Date("2007-2-1") & as.Date(Date) <= as.Date("2007-2-2"))
#Remove the old data to fresh the memory
rm(data)
subset_data<- subset_data[complete.cases(subset_data)]
#Combine date and time to dateTime

dateTime <- as.POSIXct(paste(subset_data$Date, subset_data$Time, sep = " "))
#Plot the graph
plot(subset_data$Sub_metering_1~dateTime, type = "l", ylab = "Energy sub metering", xlab = "")
##lines(data_load_subset$TS, data_load_subset$Sub_metering_1)
lines(dateTime, subset_data$Sub_metering_2, col = "red")
lines(dateTime, subset_data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"))

#Copy the graph into a png file with the width= 480 and height = 480
dev.copy(png,"plot3.png", width=480, height=480)
#CLOSE DEVICE
dev.off()

#You can go and check the png file in your current location
list.files()
