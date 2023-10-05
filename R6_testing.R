# R6

# Install the following packages

install.packages("readxl")
install.packages("tseries")
install.packages("TSA")
install.packages("gdata")

# Import the following libraries

library("readxl")
library("tseries")
library("TSA")
library("gdata")

# Read our VIX dataset
data <- read_excel("C:/Users/david/OneDrive/Desktop/UTM/Year 4/Winter 2022/STA457/Assignments/Project/Project_Data.xlsx")

regime6_data <- data[240:359,]

# Regime 6 Training Dataset
regime6_training_dataset <- regime6_data[1:118,]
regime6_training_dates <- regime6_training_dataset$Date
regime6_training_VIX_Values <- regime6_training_dataset$VIX

# Testing Dataset
regime6_testing_dataset <- data[358:359,]
regime6_testing_dates <- regime6_testing_dataset$Date
regime6_testing_VIX_Values <- regime6_testing_dataset$VIX

# Regime 6
# Differenced Series
r6_y = diff(regime6_training_VIX_Values)

r6_cummeany <- cumsum(r6_y) / seq_along(r6_y)

par(mfrow = c(2,1), mar = c(4, 4, 4, 4))

# Time Plot
plot(r6_y, type = "l", xlab = "Time", ylab = "First-order Differenced x", main = "Regime 6, Time Plot (Differenced)")

# Plot of Cummulative Mean
plot(r6_cummeany, type = "l", xlab = "Time", ylab = "Mean Level", main = "Regime 6, Plot of Cummulative Mean (Differenced)")

# Extended ACF Table
r6_y.eacf <- eacf(r6_y, ar.max = 5, ma.max = 5)

