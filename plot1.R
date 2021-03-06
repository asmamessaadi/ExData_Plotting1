##Author: ASMA MESSAADI

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
#Plot the histogram, dont forget to remove the non valid values using 
#complete.case() function
hist(subset_data$Global_active_power[complete.cases(subset_data$Global_active_power)], main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
#Copy the graph into a png file with the width= 480 and height = 480
dev.copy(png,"plot1.png", width=480, height=480)
#CLOSE DEVICE
dev.off()

#You can go and check the png file in your current location
list.files()
