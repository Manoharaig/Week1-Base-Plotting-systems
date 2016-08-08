# plot4.R

library(dplyr)
library(utils)
library(data.table)
library(ggplot2)
library(grid)
library(grDevices)
library(graphics)


dir <- "\\\\pngscitrix02/mmallesh/My Documents/data/household_power_consumption.txt"
house_pwr_consumption<- read.table (dir, header = TRUE, sep = ";", na.strings = "?")

str(house_pwr_consumption)

data <- house_pwr_consumption %>%
             filter(Date %in% c("1/2/2007", "2/2/2007"))
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

str(data)
x <- data$Datetime
y <- data$Sub_metering_1
z <- data$Sub_metering_2
w <- data$Sub_metering_3
gcp <- data$Global_active_power
vol <- data$Voltage
grp <- data$Global_reactive_power

# To create the graph

par(mfrow = c(2,2), mar = c(4,4,1,1)), oma = c(0,0,0,0), bty = "o")

# Global Active Power graph
plot(x, gcp, type = "l", xlab = "", ylab = "Global Active Power", ylim = c(0, 8))  


# Voltage graph
plot(x, vol, type = "l", xlab = "", ylab = "Voltage", ylim = c(233, 246))

# Energy sub metering
plot(x, y, type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0, 38))  
par(new = T)
plot(x, z, type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0, 38), col = "Red")
par(new = T)
plot(x, w, type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0, 38), col = "Blue")
par(new = T)
legend("topright", 
       col = c("black", "red", "blue"), 
       lty=1, lwd = 2, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.7, xpd = TRUE, yjust = 1 ) #character expansion


# Global reactive power
plot(x, grp, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.copy(png, "plot41.png")
dev.print(width = 480, height = 480)
dev.off()











