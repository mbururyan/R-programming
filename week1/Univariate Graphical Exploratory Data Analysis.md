
# Univariate Graphical Exploratory Data Analysis

## 1. Measures of Central Tendency

Before embarking on developing statistical models and generating predictions, it is essential to understand our data. This is typically done using conventional numerical and graphical methods.


```R
## Example 
# ---
# We will be using the hills dataset in this section, 
# this dataset contains information on hill climbs made by various athletes
# ---
# OUR CODE GOES BELOW
# 

# Printing the first six rows of the dataset 
# ---
# 
library(MASS)
head(hills)


```

#### Mean Code Example 1.1 


```R
## Example  
# ---
# Question: Find the mean of the distance covered by the athletes 
# and assigning the mean to the variable athletes.dist.mean
# ---
# OUR CODE GOES BELOW
# 

athletes.dist.mean <- mean(hills$dist)

# Printing out
# ---
#
athletes.dist.mean


```

#### Median Code Example 1.2


```R
## Example 
# ---
# Question: Find the median which is the middle most value of the distance covered dist
# ---
# OUR CODE GOES BELOW
# 
athletes.dist.median <- median(hills$dist)

# Printing out athletes.dist.median
# ---
# 
athletes.dist.median


```

#### Mode Code Example 1.3


```R
## Example 
# ---
# Question: Find the mode which is the value that has highest number of occurrences in a set of data. 
# ---
# OUR CODE GOES BELOW
# 

# Unfotunately, R does not have a standard in-built function to calculate mode so we have to build one
# We create the mode function that will perform our mode operation for us
# ---
# 
getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Calculating the mode using out getmode() function
# ---
#
athletes.dist.mode <- getmode(hills$dist)

# Then printing out athletes.dist.mode 
# ---
# OUR CODE GOES BELOW
# 

athletes.dist.mode 

```


```R
## Challenge 
# ---
# Question: Find the mean, median, mode of the total evening calls given the following dataset 
# ---
# Dataset url = http://bit.ly/CustomerSignatureforChurnAnalysis
# ---
# OUR CODE GOES BELOW 

library('data.table')
library(tidyverse)

# Previewing the first 6 rows of this dataset
# ---
# 

customers <- fread('http://bit.ly/CustomerSignatureforChurnAnalysis')

customers[1:6,]

# Finding the mean
# ---
# 

evening_calls_mean <- mean(customers$total_eve_calls)
evening_calls_mean


# Finding the median 
# ---
#

evening_calls_median <- median(customers$total_eve_calls)
evening_calls_median


# Finding the mode
# ---
# 

evening_calls_mode <- getmode(customers$total_eve_calls)

evening_calls_mode
```

## 2. Measures of Dispersion

#### Mininum Code Example 1.4


```R
## Example 
# ---
# Question: Find the minimum element of the distance using the min() function
# ---
# OUR CODE GOES BELOW
# 
athletes.dist.min <- min(hills$dist)

# And then printing athletes.dist.min to show the minimum element
# 
athletes.dist.min


```

#### Maximum Code Example 1.5


```R
## Example
# ---
# Question: Find the maximum element of the distance using the function max() 
# ---
# OUR CODE GOES BELOW 
# 
athletes.dist.max <- max(hills$dist)

# Then printing out the variable athletes.dist.max to show that maximum element
# ---
# OUR CODE GOES BELOW
#


```

#### Range Code Example 1.6


```R
## Example 
# ---
# Find the maximum element of the distance using the function range() as shown below
# ---
# 
athletes.dist.range <- range(hills$dist)

# Printing out the variable athletes.dist.range to show the range 
# ---
#
athletes.dist.range


```

#### Quantile Code Example 1.7


```R
## Example 
# ---
# Question: Get the first and the third quartile together with the range 
# and the median using the quantile() function
# ---
# OUR CODE GOES BELOW
# 
athletes.dist.quantile <- quantile(hills$dist)

# Printing out the variable athletes.dist.quantile to show the range  
# ---
# OUR CODE GOES BELOW
# 

```

#### Variance Code Example 1.8


```R
## Example 
# ---
# Question: Find the variance of the distance using the var() function as shown below
# ---
# OUR CODE GOES BELOW 
# 

athletes.dist.variance <- var(hills$dist)

# Printing out the the variable athletes.dist.variance to show the variance 
# 
athletes.dist.variance


```

The variance is a numerical measure of how the data values is dispersed around the mean. 

#### Standard Deviation Code Example 1.9


```R
## Example 
# ---
# Question: Find the standard deviation of vector t using the sd() function 
# ---
# OUR CODE GOES BELOW 
# 
athletes.dist.sd <- sd(hills$dist)

# Printing out the variable athletes.dist.sd to show the variance 
# ---
#
athletes.dist.sd


```


```R
# Challenge 
# ---
# Question: Find the minimum, maximum, range, quantile, variance 
# and standard deviation for total day calls using the given dataset
# ---
# Dataset url = http://bit.ly/CustomerSignatureforChurnAnalysis
# ---
# OUR CODE GOES BELOW
# 
head(customers)

# Find the minimum of total day calls
# ---
# OUR CODE GOES BELOW

min_calls <- min(customers$total_eve_calls)
min_calls

# Find the maximum i.e. max() total day calls
# ---
# OUR CODE GOES BELOW
# 

max_calls <- max(customers$total_eve_calls)
max_calls

# Find the range i.e. range() of total day calls
# ---
# OUR CODE GOES BELOW
# 
range_calls <- range(customers$total_eve_calls)
range_calls

# Find the quantile of total day calls
# ---
# OUR CODE GOES BELOW
# 

quantile_calls <- quantile(customers$total_eve_calls)
quantile_calls

# Find the variance of total day calls
# ---
# OUR CODE GOES BELOW
# 

var_calls <- var(customers$total_eve_calls)
var_calls

# Find the standard deviation of total day calls
# ---
# OUR CODE GOES BELOW
# 

stdev_calls <- sd(customers$total_eve_calls)
stdev_calls


```

## 3. Univariate Graphical

#### Box Plots Code Example 3.1


```R
## Example 
# ---
# Question: Lets create a boxplot graph for the distance using the boxplot() function
# ---
# OUR CODE GOES BELOW
# 

boxplot(hills$dist)


```

The box plot of an observation variable is a graphical representation based on its quartiles, as well as its smallest and largest values. It attempts to provide a visual shape of the data distribution.

#### Bar Graph Code Example 3.2

A bar graph of a qualitative data sample consists of vertical parallel bars that shows the frequency distribution graphically.


```R
## Example 
# ---
# Create a frequency distribution of the School variable
# ---
# Dataset Info: For this example, we will use an R built-in database named painters. 
# ---
# OUR CODE GOES BELOW
# 

# Previewing the first six rows of the painters dataset
# ---
# OUR CODE GOES BELOW
#   
head(painters)


```


```R
# Fetching the school column
# ---
# 
school <- painters$School

# Applying the table() function will compute the frequency distribution of the School variable
# ---
# 
school_frequency <- table(school)

# Printing school_frequency below
# ---
#

school_frequency

```


```R
# Then applying the barplot function to produce its bar graph
# ---
# 

barplot(school_frequency)


```


```R
## Challenge
# ---
# Question: Create a bar graph of the total day calls in the customer signature dataset
# ---
# Dataset url = http://bit.ly/CustomerSignatureforChurnAnalysis
# ---
# OUR CODE GOES BELOW
#

head(customers)

#assign the content of column to a variable
day_calls <- customers$total_day_calls


# create a table for its counts
day_calls_table <- table(day_calls)
day_calls_table

# Create a barchart
day_calls_barplot <- barplot(day_calls_table)


# It is normally distributed

```

#### Histogram Code Example 3.3

A histogram shows the frequency distribution of a quantitative variable. The area of each bar is equal to the frequency of items found in each class.


```R
## Example
# ---
# Create a histogram using the faithful dataset 
# --- 
# Hint: we will use an R built-in data frame called faithful 
# ---
# OUR CODE GOES BELOW
# 

# Preview the first six rows of the faithful dataset
# ---
# OUR CODE GOES BELOW
# 

head(faithful)

```


```R
# Then applying the hist() function to produce the histogram of the eruptions variable 
# ---
# 
hist(faithful$eruptions)


```


```R
## Challenge 
# ---
# Question: Create a histogram of the total day minutes in the customer signature dataset 
# ---
# Dataset url = http://bit.ly/CustomerSignatureforChurnAnalysis
# ---
# OUR CODE GOES BELOW
# 

hist(customers$total_day_minutes)


```
