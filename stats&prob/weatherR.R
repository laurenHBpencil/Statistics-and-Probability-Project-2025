install.packages("readxl")
#instal package to read excel files

#loading the readxl package
library(readxl)

#reading in weather data from download folder
weather <- read_excel("C:/Users/laure/Downloads/Weather Data for Assessment (2).xlsx")

#convert humidity column to nums to do calculations
humidity <- as.numeric(weather$humidity)

#calculating stats for humidity
mean(humidity, na.rm = TRUE)#ave humidity
median(humidity, na.rm = TRUE)#middle val
min(humidity, na.rm = TRUE)#lowest humidity
max(humidity, na.rm = TRUE)#highest humidity
sd(humidity, na.rm = TRUE)#standard deviattion
var(humidity, na.rm = TRUE) #variance
range(humidity, na.rm = TRUE)#range
IQR(humidity, na.rm = TRUE)#interquartile range
quantile(humidity, 0.25, na.rm = TRUE)#25th percentile
quantile(humidity, 0.75, na.rm = TRUE)#75th percentile

#converting other cols to numeric for plots
air_pressure <- as.numeric(weather$`air pressure`)
windspeed <- as.numeric(weather$windspeed)
gustspeed <- as.numeric(weather$`gust speed`)

#plot humidity vs air pressure
plot(humidity, air_pressure,
     main = "humidity vs air pressure",
     xlab = "humidity %",
     ylab = "air pressure hPa",
     col = "pink", pch = 16)

#plot windspeed vs gust speed
plot(windspeed, gustspeed,
     main = "windspeed vs gust speed",
     xlab = "windspeed km/h",
     ylab = "gust speed km/h",
     col = "purple", pch = 16)

#adding line of best fit to the second plot
model <- lm(gustspeed ~ windspeed)
abline(model, col = "red", lwd = 2)
