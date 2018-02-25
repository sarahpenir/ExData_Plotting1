## Exploratory Data Analysis - Week 1
## Plot 1

# Load the data

table <- read.table("./household_power_consumption.txt", header = TRUE,
                    sep = ";", stringsAsFactors = FALSE,
                    colClasses=c("character","character", rep("numeric",7)), na.strings=c('?'))

# Fix date and time

table$DateTime <- strptime(paste(table$Date, table$Time), format="%d/%m/%Y %H:%M:%S")
table_subset <- table[table$DateTime>= as.POSIXlt("2007-02-01") & table$DateTime<as.POSIXlt("2007-02-03"),]

# Plot

png("plot1.png", width=480, height=480, units="px", bg="transparent")

hist(table_subset$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()
