
# Missing Data

## 1. Finding Missing Values


In R, the missing values are shown by the symbol NA. To identify missing values in your dataset the function is.na() is normally used.

#### Finding Missing Values Example 1.1 


```R
## Example 
# ---
# Lets create a dataset dt
# ---
# OUR CODE GOES BELOW
#
Name <- c("John", "Tim", NA)
Sex <- c("men", "men", "women")
Age <- c(45, 53, NA)
dt <- data.frame(Name, Sex, Age)

# Then print out this dataset below
dt


```


```R
# Lets Identify missing data in your dataset 
# by using the function is.na() 
# ---
# 
is.na(dt)


```


```R
# Example 
# ---
# We can also find out total missing values in each column 
# by using the function colSums()
# ---
# OUR CODE GOES BELOW
#
colSums(is.na(dt))


```

## 2. Dealing with Missing Values


Using na.omit() to omit all rows containing missing values.

#### Dealing with Missing Values Code Example 2.1


```R
## Example 
# ---
# Question: Show all rows from the dataset which don't contain any missing values 
# ---
# OUR CODE GOES BELOW
#
na.omit(dt)

```

#### Dealing with Missing Values Code Example 2.2


```R
## Example 
# ---
# Question: Recode/fill the missing value in a column with a number
# ---
# OUR CODE GOES BELOW
#
dt$Age[is.na(dt$Age)] <- 99

dt
```

#### Dealing with Missing Values Code Example 2.3


```R
## Example
# ---
# Question: Recode or fill the missing value in a column with the mean value of the column-#-
# ---
# OUR CODE GOES BELOW
#
dt$Age[is.na(dt$Age)] <- mean(dt$Age, na.rm = TRUE)

# print the dt table below

```


```R
## Challenge 1
# ---
# Question: Using the given bus dataset below, recode the missing values of the payment_method 
# and travel_to columns with athen appropriate values
# ---
# OUR CODE GOES BELOW
#

# Lets first of all import our data table
# ---
#
library("data.table")
bus_dataset <- fread('http://bit.ly/BusNairobiWesternTransport')

# First check have a look at the dataset
# --
#
head(bus_dataset)


```


```R
## Challenge 2
# ---
# Question: Clean the given dataset 
# ---
# Dataset url = http://bit.ly/MS-PropertyDataset

library(tidyverse)
library('data.table')


df_property <- fread('http://bit.ly/MS-PropertyDataset')


head(df_property)

# ---
# OUR CODE GOES BELOW
# 


```


```R
## Challenge 3
# ---
# Question: 
# ---
# Dataset url = http://bit.ly/AirQualityDataset
# ---
# OUR CODE GOES BELOW
# 

air_df <- fread('http://bit.ly/AirQualityDataset')
ari_df


```
