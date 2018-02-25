## Exploratory Data Analysis - Week 1
## Plot 3

# Load the data

table <- read.table("./household_power_consumption.txt", header = TRUE,
                    sep = ";", stringsAsFactors = FALSE,
                    colClasses=c("character","character", rep("numeric",7)), na.strings=c('?'))

# Fix date and time

table$DateTime <- strptime(paste(table$Date, table$Time), format="%d/%m/%Y %H:%M:%S")
table_subset <- table[table$DateTime>= as.POSIXlt("2007-02-01") & table$DateTime<as.POSIXlt("2007-02-03"),]

# Plot

png("plot3.png", width=480, height=480, units="px", bg="transparent")

plot(table_subset$DateTime, table_subset$Sub_metering_1, main="", ylab='Energy sub metering', type='l', xlab="")
lines(table_subset$DateTime, table_subset$Sub_metering_2, col='red')
lines(table_subset$DateTime, table_subset$Sub_metering_3, col='blue')
legend("topright",c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd=1, col=c('black','red','blue'))

dev.off()
