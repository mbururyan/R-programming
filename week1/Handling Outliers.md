
# Outliers

## 1. Screening for Outliers

In the process of producing, collecting, processing and analyzing data, outliers can come from many sources and hide in many dimensions. An outlier is an observation that is numerically distant from the rest of the data. When reviewing a boxplot, an outlier is defined as a data point that is located outside the fences (“whiskers”) of the boxplot.




```R
## Example 
# ---
# Let's create the vector A
# ---
# 

A <- c(3, 2, 5, 6, 4, 8, 1, 2, 30, 2, 4)

# then print it out 
A


```


```R
# We then plot a boxplot to help us visualise any existing outliers 
# ---
#  
boxplot(A)


```


```R
# Then use the function boxplot.stats which lists the outliers in the vectors
# ---
# 
boxplot.stats(A)$out


```

Outliers should be investigated carefully. Often they contain valuable information about the process under investigation or the data gathering and recording process. Before considering the possible elimination of these points from the data, one should try to understand why they appeared and whether it is likely similar values will continue to appear. Of course, outliers are often bad data points.

## 2. Obvious Inconsistencies 

An obvious inconsistency occurs when a record contains a value or combination of values that cannot correspond to a real-world situation. For example, a person's age cannot be negative, a man cannot be pregnant and an under-aged person cannot possess a drivers license.


```R
## Example 
# ---
# Say from our vector x above, values above 20 are obvious inconsistencies 
# then we using logical indices to check for 
# ---
#
non_greater_than_20 <- A > 20

# printing out non_greater_than_20
non_greater_than_20


```


```R
# Challenge 
# ---
# Question: Use the given bus dataset below, determine whether there are any obvious inconsistencies 
# ---
# Dataset url = http://bit.ly/BusNairobiWesternTransport
# ---
# OUR CODE GOES BELOW
# 

# Importing our database
# ---
# 

install.package("data.table") # install package data.table to work with data tables
library(data.table) # load package
install.package("tidyverse") # install packages to work with data frame - extends into visualization
library(tidyverse) 

bus_url <- 'http://bit.ly/BusNairobiWesternTransport'

#downloading the dataset
setwd(file.path(''d:/))
local <- file.path('data', 'demodt.data')
download.file(bus_url, local)



bus_dataset <- fread('http://bit.ly/BusNairobiWesternTransport')



# Previewing the dataset
# ---
# 
View(bus_dataset)
str(bus_dataset)
dim(bus_dataset)
class(bus_dataset)

# Identifying the numeric class in the data and evaluating if there are any outliers
# ---
# OUR CODE GOES BELOW
# 


```
