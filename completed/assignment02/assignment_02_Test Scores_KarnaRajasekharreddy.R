# Assignment: ASSIGNMENT 2 _ Test Scores
# Name: Karna, Rajasekhar Reddy
# Date: 2020-09-13

## Read Test Scores file
setwd("C:/Users/vahin/Documents/GitHub/dsc520/")
test_scores <- read.csv("data/scores.csv", header = TRUE)

## Examine the structure and display summary statistics
str(test_scores)
summary(test_scores)

## Assigning veriable based on student Sections and display summary statistics
sports_students <- subset(test_scores, Section == "Sports")
regular_students <- subset(test_scores, Section == "Regular")
summary(sports_students)
summary(regular_students)

## Import Plot library and Plot data based on sections
## For installation of ggplot2 package, used install.packages("ggplot2")
library(ggplot2)
Section_Based_Histogram_Plot <- ggplot(data = test_scores, aes(x = Score, fill = Section)) + 
  geom_histogram(bins = 30, color = "white") + 
  ggtitle("Grades by Section")
Section_Based_Histogram_Plot

## Comparing score distribution between Sports and Regular sections
mean(sports_students$Score) < mean(regular_students$Score)
median(sports_students$Score) < median(regular_students$Score)

## Read the file `data/scores.csv` to `scores_df`
## Display summary statistics using the `summary()` function
scores_df <- read.csv("data/scores.csv", stringsAsFactors = FALSE)
summary(scores_df)
