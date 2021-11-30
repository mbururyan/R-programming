
# R Programming: K-Means Clustering

## Example


```R
## Example 
# ---
# Question: Perform clustering analysis on the following dataset using the K-Means clustering algorithm.
# ---
# OUR CODE GOES BELOW
# 

# Load and view the dataset 
# ---
# Importing the dataset
# ---
# 
require("datasets")

# Loading the Iris dataset
# ---
# 
data("iris")

# Viewing the structure of the dataset
# ---
#
str(iris)




```


```R
# Viewing the statistical summary of the dataset
# ---
# 
summary(iris) 


```


```R
# Previewing the dataset
# ---
# 
head(iris) 


```


```R
# Preprocessing the dataset
# ---
# Since clustering is a type of Unsupervised Learning, 
# we would not require Class Label(output) during execution of our algorithm. 
# We will, therefore, remove Class Attribute “Species” and store it in another variable. 
# We would then normalize the attributes between 0 and 1 using our own function.
# ---
#
iris.new<- iris[, c(1, 2, 3, 4)]
iris.class<- iris[, "Species"]
head(iris.new)


```


```R
# Previewing the class column
# ---
# 
head(iris.class)


```


```R
# Normalizing the dataset so that no particular attribute 
# has more impact on clustering algorithm than others.
# ---
# 
normalize <- function(x){
  return ((x-min(x)) / (max(x)-min(x)))
}

iris.new$Sepal.Length<- normalize(iris.new$Sepal.Length)
iris.new$Sepal.Width<- normalize(iris.new$Sepal.Width)
iris.new$Petal.Length<- normalize(iris.new$Petal.Length)
iris.new$Petal.Width<- normalize(iris.new$Petal.Width)
head(iris.new)


```


```R
# Applying the K-means clustering algorithm with no. of centroids(k)=3
# ---
# 
result<- kmeans(iris.new,3) 

# Previewing the no. of records in each cluster
# 
result$size 


```


```R
# Getting the value of cluster center datapoint value(3 centers for k=3)
# ---
# 
result$centers 


```


```R
# Getting the cluster vector that shows the cluster where each record falls
# ---
# 
result$cluster

# The graph shows that we have got 3 clearly distinguishable clusters for Ozone and Solar.R data points.
# Let’s see how clustering has performed on Wind and Temp attributes.
```


```R
# Visualizing the  clustering results
# ---
# 
par(mfrow = c(1,2), mar = c(5,4,2,2))

# Plotting to see how Ozone and Solar.R data points have been distributed in clusters
# ---
#
plot(airquality[,1:2], col = result$cluster) 
```


```R
# Verifying the results of clustering
# ---
# 
par(mfrow = c(2,2), mar = c(5,4,2,2))

# Plotting to see how Sepal.Length and Sepal.Width data points have been distributed in clusters
plot(iris.new[c(1,2)], col = result$cluster)

# Plotting to see how Sepal.Length and Sepal.Width data points have been distributed 
# originally as per "class" attribute in dataset
# ---
#
plot(iris.new[c(1,2)], col = iris.class)

# Plotting to see how Petal.Length and Petal.Width data points have been distributed in clusters
# ---
# 
plot(iris.new[c(3,4)], col = result$cluster)
plot(iris.new[c(3,4)], col = iris.class)
```


```R
# Result of table shows that Cluster 1 corresponds to Virginica, 
# Cluster 2 corresponds to Versicolor and Cluster 3 to Setosa.
# ---
# 
table(result$cluster, iris.class)
```

In order to improve this accuracy further, we may try different values of “k”. In some cases, it is also beneficial to change the algorithm in case k-means is unable to yield good results.



## Challenges


```R
## Challenge 1
# ---
# Question: Apply unsupervised learning to the given airquality dataset below.
# ---
# OUR CODE GOES BELOW
# 

# Load and view the dataset 
# ---
# Importing the dataset
# ---
# 
data("airquality")
str(airquality)

# Clean the dataset
colSums(is.na(airquality))

#specify columns with missing values
list_na <- colnames(airquality)[apply(airquality, 2, anyNA)]

list_na
# Fill null values with mean

# define mean for columns with missing values

mean_null <- apply(airquality[,colnames(airquality) %in% list_na],
2,
mean,
na.rm = TRUE)

mean_null

# replace null values

airquality$Ozone[is.na(airquality$Ozone)] <- mean(airquality$Ozone, na.rm=TRUE)

airquality$Solar.R[is.na(airquality$Solar.R)] <- mean(airquality$Solar.R, na.rm=TRUE)

# check for null values after
colSums(is.na(airquality))

```

```R
# Preprocessing

# Split data into x and y

air_new <- airquality[, c(1, 2, 3, 4)]

air_label <- airquality[, 'Month']


# Normalize data in air_new

normalize <- function(x){
  return ((x-min(x)) / (max(x)-min(x)))
}

#Apply for every column

air_new$Ozone<- normalize(air_new$Ozone)

air_new$Solar.R<- normalize(air_new$Solar.R)
air_new$Wind<- normalize(air_new$Wind)
air_new$Temp<- normalize(air_new$Temp)
head(air_new)

 
```

```R

# Perform K means clustering

clusters <- kmeans(air_new, 5)

clusters$size

clusters$centers

clusters$cluster

```

```R

#Plotting the clusters

# Ozone vs Solar R
plot(air_new[c(1, 2)], col=clusters$cluster)

# The OG
plot(air_new[c(1, 2)], col=air_label)

# Wind vs temp
plot(air_new[c(3, 4)], col=clusters$cluster)

# The OG
plot(air_new[c(3, 4)], col=air_label)



```


```R
## Challenge 2
# ---
# Question: Create a model that clusters the following dataset.
# ---
# Dataset = http://bit.ly/SalaryDatasetClustering
# ---


salary <- read.csv('http://bit.ly/SalaryDatasetClustering')
head(salary)
# 


```


```R
## Challenge 3
# ---
# Question: Cluster customers from the given wholesale customer database.
# ---
# Dataset source = https://archive.ics.uci.edu/ml/datasets/Wholesale+customers


# ---
# 


```
