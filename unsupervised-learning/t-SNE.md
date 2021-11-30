
# t-Distributed Stochastic Neighbor Embedding (t-SNE)


## Example 


```R
## Example 1
# ---
# Question: Apply the t-SNE to the MNIST dataset.
# ---
# Dataset url = http://bit.ly/MNISTDataset
# ---
# OUR CODE GOES BELOW
# 

# Loading our dataset
# 
train<- read.csv('http://bit.ly/MNISTDataset')  


```


```R
# Previewing our dataset
# 
head(train)


```


```R
# Installing Rtnse package
# 
install.packages("Rtsne")

```


```R
# Loading our tnse library
# 
library(Rtsne)


```


```R
# Curating the database for analysis 
# 
Labels<-train$label
train$label<-as.factor(train$label)

# For plotting
#
colors = rainbow(length(unique(train$label)))
names(colors) = unique(train$label)


```


```R
# Executing the algorithm on curated data
# 
tsne <- Rtsne(train[,-1], dims = 2, perplexity=30, verbose=TRUE, max_iter = 500)

# Getting the duration of execution
# 
exeTimeTsne <- system.time(Rtsne(train[,-1], dims = 2, perplexity=30, verbose=TRUE, max_iter = 500))


```


```R
# Plotting our graph and closely examining the graph
# 
plot(tsne$Y, t='n', main="tsne")
text(tsne$Y, labels=train$label, col=colors[train$label])


```

## Challenges


```R
## Challenge 1
# ---
# Question: Apply t-SNE on the Iris dataset. This help us to decide whether classes are separable 
# in some linear or nonlinear representation.
# ---
# OUR CODE GOES BELOW
# 
# 

# Loading our iris datset
#
Iris <- iris
head(Iris)


```


```R
## Challenge 2
# ---
# Question: Apply t-SNE to the digits dataset to visualize clusters of handwritten digits.
# ---
# Dataset url = http://bit.ly/DigitsDataset
# ---
# OUR CODE GOES BELOW
# 

# Loading our dataset 
traindata <- read.table("http://bit.ly/DigitsDataset", sep=",")
head(traindata)


```


```R
## Challenge 3
# ---
# Question: Apply t-SNE to the following single cell RNA-seq Dataset.
# ---
# Dataset url = http://bit.ly/RNA-seqDataset
# ---
# OUR CODE GOES BELOW
# 


```
