# Assignment: ASSIGNMENT 3 2014 American Community Survey
# Name: Karna, RajasekharReddy
# Date: 2020-09-20

## Load the ggplot2 package
library(ggplot2)
library(pastecs)
library(ggfortify)
library(moments)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/vahin/Documents/GitHub/dsc520/")

## Load the `data/acs-14-1yr-s0201.csv` and capturing few rows of same data using head()
Comm_Survey <- read.csv("data/acs-14-1yr-s0201.csv")
## Examine the structure and display summary statistics usign str(), nrow(), ncol()
str(Comm_Survey)
summary(Comm_Survey)
head(Comm_Survey, 2)
paste("Number of rows =", nrow(Comm_Survey), "; Number of columns = ", ncol(Comm_Survey), ";")
## Building Histogram plot of the HSDegree variable 
## Setting BIN size, Title, X/Y axis labels
ggplot(Comm_Survey, aes(x=HSDegree)) + geom_histogram(bins = 140, color = "black", fill = "skyblue") + xlab("% of High School Degrees") + ylab("No. of Counties") + ggtitle("Histogram of % of High School Degrees per county")
## Calculating mean, median and standard deviation values to apply normal curve on historgram
print(mean(Comm_Survey$HSDegree))
print(median(Comm_Survey$HSDegree))
print(sd(Comm_Survey$HSDegree))
ggplot(Comm_Survey, aes(x=HSDegree)) + geom_histogram(bins = 140, color = "black", fill = "skyblue") + xlab("% of High School Degrees") + ylab("No. of Counties") + ggtitle("Histogram of % of High School Degrees per county") + stat_function(fun = function(x) dnorm(x, mean(Comm_Survey$HSDegree), sd(Comm_Survey$HSDegree))* 50)
## Plotting Probability Distributions (Normal Distribution) using Kernel Plot
ggplot(Comm_Survey, aes(x=HSDegree)) + geom_density(bins = 140, color = "black", fill = "skyblue") + xlab("% of High School Degrees") + ylab("No. of Counties") + ggtitle("Histogram of % of High School Degrees per county")
ggplot(Comm_Survey, aes(x=HSDegree)) + geom_density(color = "black", fill = "skyblue") + xlab("% of High School Degrees") + ylab("No. of Counties") + ggtitle("Histogram of % of High School Degrees per county") + stat_function(fun = function(z) dnorm(z, mean(Comm_Survey$HSDegree), sd(Comm_Survey$HSDegree)))
##quantify normality with numbers using the stat.desc() function
stat.desc(Comm_Survey, basic=TRUE, desc=TRUE, norm=FALSE)
## Calculate skewness, kurtosis and zscore for HSDegree
skewness(Comm_Survey$HSDegree)
kurtosis(Comm_Survey$HSDegree)
print(zscore <- (Comm_Survey$HSDegree - mean(Comm_Survey$HSDegree)) / sd(Comm_Survey$HSDegree))
