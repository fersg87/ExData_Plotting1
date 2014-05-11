# Reading data set
fileName <- "household_power_consumption.txt"
data <- read.csv(fileName, header = TRUE, sep = ";", quote = "\"", dec = ".", fill = TRUE, comment.char = "", colClasses= c("character","character", "character", "character", "character", "character", "character", "character", "character"))

# Filtering only dates between 2007-02-01 and 2007-02-02
data$Date = as.Date(data$Date, "%d/%m/%Y")
startDate = as.Date("01/02/2007", "%d/%m/%Y")
endDate = as.Date("02/02/2007", "%d/%m/%Y")
householdData = data[data$Date >= startDate & data$Date <= endDate,]

# Coercing columns to its data type
householdData$Global_active_power = as.numeric(householdData$Global_active_power)
householdData$DateTime = paste(householdData$Date, householdData$Time)
householdData$DateTime = as.POSIXlt(householdData$DateTime)
householdData$Sub_metering_1 = as.numeric(householdData$Sub_metering_1)
householdData$Sub_metering_2 = as.numeric(householdData$Sub_metering_2)
householdData$Sub_metering_3 = as.numeric(householdData$Sub_metering_3)
householdData$Voltage = as.numeric(householdData$Voltage)
householdData$Global_reactive_power = as.numeric(householdData$Global_reactive_power)

# Plot 1
hist(householdData$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab="Frequency", 
     main = "Global Active Power",
     xlim=c(0, 6),
     ylim=c(0, 1200))
dev.copy(png,'plot1.png')
dev.off()