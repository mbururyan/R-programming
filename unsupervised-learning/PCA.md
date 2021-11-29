
# R Programming: Principal Component Analysis

# Example 


```R
## Example 
# ---
# Perform and visualize PCA in the given mtcars dataset 
# ---
# OUR CODE GOES BELOW
# 

# Loading our dataset
# ---
# 
df <- mtcars
head(df)


```


```R
# Selecting the numerical data (excluding the categorical variables vs and am)
# ---
# 
df <- mtcars[,c(1:7,10,11)]
head(df)


```


```R
# We then pass df to the prcomp(). We also set two arguments, center and scale, 
# to be TRUE then preview our object with summary
# ---
# 
mtcars.pca <- prcomp(df, center = TRUE, scale. = TRUE)
summary(mtcars.pca)

# As a result we obtain 9 principal components, 
# each which explain a percentate of the total variation of the dataset
# PC1 explains 63% of the total variance, which means that nearly two-thirds 
# of the information in the dataset (9 variables) can be encapsulated 
# by just that one Principal Component. PC2 explains 23% of the variance. etc
```


```R
# Calling str() to have a look at your PCA object
# ---
# 
str(mtcars.pca)


# Here we note that our pca object: The center point ($center), scaling ($scale), 
# standard deviation(sdev) of each principal component. 
# The relationship (correlation or anticorrelation, etc) 
# between the initial variables and the principal components ($rotation). 
# The values of each sample in terms of the principal components ($x)
```


```R
# We will now plot our pca. This will provide us with some very useful insights i.e. 
# which cars are most similar to each other 
# ---
# 

# Installing our ggbiplot visualisation package

library(openxlsx)
library(reshape2)
library(plyr)
library(scales)
library(ggplot2)

library(devtools)
library(grid)

# 
library(devtools)

install_github("vqv/ggbiplot", force=TRUE)

install.packages("remotes")
remotes::install_github("vqv/ggbiplot")


```


```R
# Then Loading our ggbiplot library
#  
library(ggbiplot)
ggbiplot(mtcars.pca)

# From the graph we will see that the variables hp, cyl and disp contribute to PC1, 
# with higher values in those variables moving the samples to the right on the plot. 
```


```R
# Adding more detail to the plot, we provide arguments rownames as labels
# 
ggbiplot(mtcars.pca, labels=rownames(mtcars), obs.scale = 1, var.scale = 1)

# We now see which cars are similar to one another. 
# The sports cars Maserati Bora, Ferrari Dino and Ford Pantera L all cluster together at the top
```


```R
# We can also look at the origin of each of the cars by putting them 
# into one of three categories i.e. US, Japanese and European cars.
# 
mtcars.country <- c(rep("Japan", 3), rep("US",4), rep("Europe", 7),rep("US",3), "Europe", rep("Japan", 3), rep("US",4), rep("Europe", 3), "US", rep("Europe", 3))

ggbiplot(mtcars.pca,ellipse=TRUE,  labels=rownames(mtcars), groups=mtcars.country, obs.scale = 1, var.scale = 1)

# We get to see that US cars for a cluster on the right. 
# This cluster is characterized by high values for cyl, disp and wt. 
# Japanese cars are characterized by high mpg. 
# European cars are somewhat in the middle and less tightly clustered that either group.
```


```R
# We now plot PC3 and PC4
ggbiplot(mtcars.pca,ellipse=TRUE,choices=c(3,4),   labels=rownames(mtcars), groups=mtcars.country)


# We find it difficult to derive insights from the given plot mainly because PC3 and PC4 
# explain very small percentages of the total variation, thus it would be surprising 
# if we found that they were very informative and separated the groups or revealed apparent patterns.

```


```R
# Having performed PCA using this dataset, if we were to build a classification model 
# to identify the origin of a car (i.e. European, Japanese, US), 
# the variables cyl, disp, wt and mpg would be significant variables as seen in our PCA analysis.
```

## Challenges 


```R
## Challenge 1
# ---
# Question: Perform and plot PCA to the give Iris dataset. Reduce 4 dimensinal data into 2 or three dimensions. 
# Provide remarks on your analysis.
# ---
# Dataset url = http://bit.ly/IrisDataset
# ---
# OUR CODE GOES BELOW
# 

iris <- read.csv('http://bit.ly/IrisDataset')
head(iris)

iris_var <- iris[, 1:4]

#Perform pca

pca_iris <- prcomp(iris_var, center=TRUE, scale. = TRUE)

summary(pca_iris)

str(pca_iris)

ggbiplot(pca_iris)


#add more detail

ggbiplot(pca_iris, labels=iris$species, groups = iris$species, obs.scale=1, var.scale=1)

iris$species

```


```R
## Challenge 2
# ---
# Question: Perform and plot PCA on the given dataset.
# ---
# Dataset url = http://bit.ly/WisconsinDataset
# ---
# OUR CODE GOES BELOW
# 


```


```R
## Challenge 3
# ---
# Question: Perform and plot the given housing dataset. Provide remarks to your analysis. 
# ---
# Dataset url = http://bit.ly/BostonHousingDataset
# ---
# OUR CODE GOES BELOW
# 


```
