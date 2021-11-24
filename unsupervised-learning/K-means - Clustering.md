
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


```


```R
## Challenge 2
# ---
# Question: Create a model that clusters the following dataset.
# ---
# Dataset = http://bit.ly/SalaryDatasetClustering
# ---
# OUR CODE GOES BELOW
# 


```


```R
## Challenge 3
# ---
# Question: Cluster customers from the given wholesale customer database.
# ---
# Dataset source = https://archive.ics.uci.edu/ml/datasets/Wholesale+customers
# ---
# OUR CODE GOES BELOW
# 


```
