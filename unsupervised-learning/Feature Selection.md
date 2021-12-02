
# Feature Selection in Unsupervised Learning


```R
## Example 1: Filter Methods 
# ---
# We can use the findCorrelation function included in the caret package to create a subset of variabes. 
# This function would allows us to remove redundancy by correlation using the given dataset. 
# It would search through a correlation matrix and return a vector of integers corresponding to the columns, 
# to remove or reduce pair-wise correlations.
# ---
# OUR CODE BELOW
# 

# Loading our Data
# ---
# 
path<-"http://bit.ly/FeatureSelectionDataset" 

Dataset<-read.csv(path, sep = ",", dec = ".",row.names = 1)
Dataset<-Dataset[-4] 
head(Dataset,3)

```


```R
# Installing and loading our caret package
# ---
# 
suppressWarnings(
        suppressMessages(if
                         (!require(caret, quietly=TRUE))
                install.packages("caret")))
library(caret)

```


```R
# Installing and loading the corrplot package for plotting
# ---
# 
suppressWarnings(
        suppressMessages(if
                         (!require(corrplot, quietly=TRUE))
                install.packages("corrplot")))
library(corrplot)

```


```R
# Calculating the correlation matrix
# ---
#
correlationMatrix <- cor(Dataset)

# Find attributes that are highly correlated
# ---
#
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.75)

# Highly correlated attributes
# ---
# 
highlyCorrelated

names(Dataset[,highlyCorrelated])

```


```R
# We can remove the variables with a higher correlation 
# and comparing the results graphically as shown below
# ---
# 
# Removing Redundant Features 
# ---
# 
Dataset2<-Dataset[-highlyCorrelated]

# Performing our graphical comparison
# ---
# 
par(mfrow = c(1, 2))
corrplot(correlationMatrix, order = "hclust")
corrplot(cor(Dataset2), order = "hclust")

```


```R
# Example 2: Wrapper Methods 
# ---
# We use the clustvarsel package that contains an implementation of wrapper methods. 
# The clustvarsel function will implement variable section methodology 
# for model-based clustering to find the optimal subset of variables in a dataset.
# ---
# OUR CODE GOES BELOW
# 

# Loading data from our csv file
# ---
#
path<-"http://bit.ly/FeatureSelectionDataset2" 
Dataset<-read.csv(path, sep = ",", dec = ".",row.names = 1)
head(Dataset)

```


```R
# Installing and loading our clustvarsel package
# ---
# 
suppressWarnings(
        suppressMessages(if
                         (!require(clustvarsel, quietly=TRUE))
                install.packages("clustvarsel")))
                         
library(clustvarsel)

```


```R
# Installing and loading our mclust package
# ---
# 
suppressWarnings(
        suppressMessages(if
                         (!require(mclust, quietly=TRUE))
                install.packages("mclust")))
library(mclust)

```


```R
# Sequential forward greedy search (default)
# ---
#
out = clustvarsel(Dataset, G = 1:5)
out

```


```R
# The selection algorithm would indicate that the subset 
# we use for the clustering model is composed of variables X1 and X2 
# and that other variables should be rejected. 
# Having identified the variables that we use, we proceed to build the clustering model:
# ---
#

Subset1 = Dataset[,out$subset]
mod = Mclust(Subset1, G = 1:5)
summary(mod)

```


```R
plot(mod,c("classification"))

```


```R
# Example 3: Embedded Methods
# ---
# We will use the ewkm function from the wskm package.
# This is a weighted subspace clustering algorithm that is well suited to very high dimensional data.
# ---
# OUR CODE GOES BELOW
# 

# We install and load our wskm package
# ---
#
suppressWarnings(
        suppressMessages(if
                         (!require(wskm, quietly=TRUE))
                install.packages("wskm")))
library(wskm)

set.seed(2)
model <- ewkm(iris[1:4], 3, lambda=2, maxiter=1000)

```


```R
# Loading and installing our cluster package
# ---
#
suppressWarnings(
        suppressMessages(if
                         (!require(cluster, quietly=TRUE))
                install.packages("cluster")))
library("cluster")

# Cluster Plot against 1st 2 principal components
# ---
#
clusplot(iris[1:4], model$cluster, color=TRUE, shade=TRUE,
         labels=2, lines=1,main='Cluster Analysis for Iris')

```


```R
# Weights are calculated for each variable and cluster. 
# They are a measure of the relative importance of each variable 
# with regards to the membership of the observations to that cluster. 
# The weights are incorporated into the distance function, 
# typically reducing the distance for more important variables.
# Weights remain stored in the model and we can check them as follows:
# 
round(model$weights*100,2)

```


```R
# Example 4: Feature Ranking
# ---
# We will use the FSelector Package. This is a package containing functions for selecting attributes from a given dataset. 
# ---
# OUR CODE GOES BELOW
# 

# We install and load the required packages
# ---
# 
suppressWarnings(
        suppressMessages(if
                         (!require(FSelector, quietly=TRUE))
                install.packages("FSelector")))
library(FSelector)
```


```R
# Loading our dataset 
# ---
#
path<-"http://bit.ly/FeatureSelectionDataset" 
Dataset<-read.csv(path, sep = ",", dec = ".",row.names = 1)

Dataset<-Dataset[-4] 
str(Dataset)
head(Dataset)

```


```R
# From the FSelector package, we use the correlation coefficient as a unit of valuation. 
# This would be one of the several algorithms contained 
# in the FSelector package that can be used rank the variables.
# ---
# 
Scores <- linear.correlation(medv~., Dataset)
Scores

```


```R
# From the output above, we observe a list containing 
# rows of variables on the left and score on the right. 
# In order to make a decision, we define a cutoff 
# i.e. suppose we want to use the top 5 representative variables, 
# through the use of the cutoff.k function included in the FSelector package. 
# Alternatively, we could define our cutoff visually 
# but in cases where there are few variables than in high dimensional datasets.
# 
# cutoff.k: The algorithms select a subset from a ranked attributes. 
# ---
#
Subset <- cutoff.k(Scores, 5)
as.data.frame(Subset)

```


```R
# We could also set cutoff as a percentage which would indicate 
# that we would want to work with the percentage of the best variables.
# ---
#
Subset2 <-cutoff.k.percent(Scores, 0.4)
as.data.frame(Subset2)

```


```R
# Instead of using the scores for the correlation coefficient, 
# we can use an entropy - based approach as shown below;
# ---
# 
Scores2 <- information.gain(medv~., Dataset)

# Choosing Variables by cutoffSubset <- cutoff.k(Scores2, 5)
# ---
# 
Subset3 <- cutoff.k(Scores2, 5)
as.data.frame(Subset3)

```

The above examples were borrowed from the book - Unsupervised Learning with R Book by Erik Rodríguez Pacheco.

## Challenges 


```R
## Challenge 1
# ---
# Perform feature selection using filter methods on the given dataset.
# ---
# Dataset url = http://bit.ly/PokemonDataset
# NB: You need to drop the label in the dataset. 
# ---
# OUR CODE GOES BELOW 
# 
```


```R
## Challenge 2
# ---
# # Perform feature selection using wrapper methods on the given dataset.
# ---
# Dataset url = http://bit.ly/ZomatoDataset
# NB: You need to drop the label in the dataset. 
# ---
# OUR CODE GOES BELOW 
# 
```


```R
## Challenge 3
# ---
# Compare embedded methods and feature ranking while performing feature selection on the given dataset.
# ---
# Dataset url = http://bit.ly/WineDataset2 
# ---
# OUR CODE GOES BELOW 
# 
```


```R
## Challenge 4
# ---
# Given the following dataset, perform feature selection using all the above methods.
# ---
# Dataset url = http://bit.ly/FIFADataset
# ---
# OUR CODE GOES BELOW 
# 
```
