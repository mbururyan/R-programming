
# Hierarchical Clustering

## Example 


```R
## Example 
# ---
# Question: Implement the hierarchical clustering algorithm using the Arrests dataset
# ---
# OUR CODE GOES BELOW
# 

# Loading the data set
# ---
#
data("USArrests")




```


```R
# Remove any missing value (i.e, NA values for not available)
# That might be present in the data
# ---
# 
df <- na.omit(USArrests)


```


```R
# Previewing our dataset
# ---
#
head(df)


```


```R
# Before hierarchical clustering, we can compute some descriptive statistics
# ---
# 
desc_stats <- data.frame(
  Min = apply(df, 2, min),    # minimum
  Med = apply(df, 2, median), # median
  Mean = apply(df, 2, mean),  # mean
  SD = apply(df, 2, sd),      # Standard deviation
  Max = apply(df, 2, max)     # Maximum
)
desc_stats <- round(desc_stats, 1)
head(desc_stats)

# We note that the variables have a large different means and variances. 
# This is explained by the fact that the variables are measured in different 
# units; Murder, Rape, and Assault are measured as the number of occurrences per 100 000 people, 
# and UrbanPop is the percentage of the state’s population that lives in an urban area.
# They must be standardized (i.e., scaled) to make them comparable. Recall that, 
# standardization consists of transforming the variables such that 
# they have mean zero and standard deviation one. 
```


```R
# As we don’t want the hierarchical clustering result to depend to an arbitrary variable unit, 
# we start by scaling the data using the R function scale() as follows
# ---
# 
df <- scale(df)
head(df)
```


```R
# We now use the R function hclust() for hierarchical clustering
# ---
# 

# First we use the dist() function to compute the Euclidean distance between observations, 
# d will be the first argument in the hclust() function dissimilarity matrix
# ---
#
d <- dist(df, method = "euclidean")

# We then hierarchical clustering using the Ward's method
# ---
# 
res.hc <- hclust(d, method = "ward.D2" )


```


```R
# Lastly, we plot the obtained dendrogram
# ---
# 
plot(res.hc, cex = 0.6, hang = -1)


```

## Challenges


```R
## Challenge 1
# ---
# Question: Using the USArrests datasets in the above example, 
# compute hierarchical clustering with other linkage methods, 
# such as single, median, average, centroid, Ward’s and McQuitty’s.
# ---
# Hint: You can refer to the R documentation in the suggested resources
# ---
# OUR CODE GOES BELOW

head(df)

model2 <- hclust(d, method='complete')

plot(model2, cex=0.6, hang=-1)
#


```


```R
## Challenge 2
# ---
# Question: Perform hierarchical clustering using the mtcars dataset
# ---
# OUR CODE GOES BELOW 
# 

# Loading our dataset below
# ---
#  
df <- mtcars

# Previewing our dataset
# ---
# 
head(df)


#scale
df <- scale(df)
head(df)


# distance between observations
dist <- dist(df, method='euclidean')

# Build hclust model
car_model <- hclust(dist, method='complete')

car_model

#plot the hierachical tree

plot(car_model, cex=0.6, hang=-1)

```


```R
## Challenge 3
# ---
# Question: Perform hierarchical clustering using the iris dataset
# ---
# OUR CODE GOES BELOW 
# 

# Loading our dataset below
# ---
#  
df <- iris

# Previewing our dataset
# ---
# 
head(df)

#Remove the labels

df2 <- df[, c(1, 2, 3, 4)]
labels <- df[, 'Species']
head(df2)

# Scale the values
df2 <- scale(df2)
head(df2)

# Define distance between flower observations
dist <- dist(df2, method='euclidean')

# Build unsupervised model by using hierachical clusters

iris_model <- hclust(dist, method='average')


#Plot the clusters
plot(iris_model, cex=0.6, hang=-1)
```


```R
## Challenge 4
# ---
# Question: Perform hierarchical cluster analysis on the given protein consumption.
# ---
# Dataset url = http://bit.ly/HierarchicalClusteringDataset
# ---
# OUR CODE GOES BELOW 
# 


```


```R
## Challenge 5
# ---
# Question: Perform hierarchical cluster analysis on the given protein consumption.
# ---
# Dataset url = http://bit.ly/HierarchicalClusteringDataset
# ---
# OUR CODE GOES BELOW 
# 


```
