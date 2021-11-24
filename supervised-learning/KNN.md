
## KNN

KNN is a classification and regression algorithm. In case of classification, new data points get classified in a particular class on the basis of voting from nearest neighbors and in case of regression, new data get labeled based on the averages of nearest value. This algorithm is a lazy learner because it doesn’t learn much from the training data.

Below are the Steps involved in performing kNN algorithm:
* Data Collection.
* Preparing and exploring the data.
* Understanding data structure.
* Feature selection (if required)
* Data normalization.
* Creating Training and Test data set.
* Training a model on data.
* Evaluate the model performance.
* Improve the performance of model.


k nearest neighbors is a simple algorithm that stores all available cases and classifies new cases by a majority vote of its k neighbors. This algorithms segregates unlabeled data points into well defined groups. * The principle behind nearest neighbour methods is to find a predefined number of training samples closest in distance to the new point, and predict the label from these. * K represents the number of neighbours to be used in making the decision * In classification, we need to classify a new point q, give it the class that the majority of its neighbours have * For regression purposes, calculate the mean/average value of its neighbours assign it this avarage * The algorithm is an example of instance based learning methods which simple store the training examples * These methods can make the approximation locally rather than relying on the whole set of training examples * One disadvantage is that the cost of classifying a new instance can be high because nearly all computation takes place at classification time * It can also be easily fooled by irrelevant attributes

The algorithm works as follows:

For each training examples $ (x_i,f(x_i)) $ add the example to the list of training examples
Classification of q 2.1 Get the k instances that are nearest to q using some distance measure 2.2 $f(q) = arg max _{i=1}^{k} (v, f(x^i)) $
$ d(a,b) = 1 $ if a = b and zero otherwise

This means you get the class that is most common among the k instances and assign it as the class of q

For Regression, the equation in the algorithm is modified as:

$f(q) = $

The distance between instances is calculated based on all attributes
Some of the attributes may be irrelevant but still contribute in making two instances be far apart
Each of the attributes can be weighted using cross-validation techniques, by dividing the examples into training and test sets

#### KNN Code Example 1.1



```R
## Example 
# ---
# KNN Code Example 1
# ---
# 

# Reading the first 6 rows of the iris dataset
head(iris)

# Fetting a summary of our dataset
summary(iris)


```


```R
set.seed(1234)

# Randomizing the rows, creates a uniform distribution of 150
random <- runif(150)
iris_random <- iris[order(random),]

# Selecting the first 6 rows from iris_random
head(iris_random)


```


```R
# Normalizing the numerical variables of the data set. Normalizing the numerical values is really effective for algorithms, 
# as it provides a measure from 0 to 1 which corresponds to min value to the max value of the data column.
# We define a normal function which will normalize the set of values according to its minimum value and maximum value.
normal <- function(x) (
  return( ((x - min(x)) /(max(x)-min(x))) )
)
normal(1:5)
iris_new <- as.data.frame(lapply(iris_random[,-5], normal))
summary(iris_new)


head(iris_new)

```


```R
# Lets now create test and train data sets

train <- iris_new[1:130,]
test <- iris_new[131:150,]
train_sp <- iris_random[1:130,5]
test_sp <- iris_random[131:150,5]

```


```R
# Now we can use the K-NN algorithm. Lets call the "class" package which contains the K-NN algorithm.
# We then have to provide 'k' value which is no of nearest neighbours(NN) to look for 
# in order to classify the test data point.
# Lets build a model on it; cl is the class of the training data set and k is the no of neighbours to look for 
# in order to classify it accordingly.

library(class)    
require(class)
model <- knn(train= train,test=test,cl= train_sp,k=13)
table(factor(model))
table(test_sp,model)


```

The table(test_sp, model) matrix is also called confusion matrix. It has test_sp on one axis and model prediction on the other. The diagonal elements are the no of correctly predicted observations for that species. We can see how the model performed. It has predicted all the species correctly.

#### KNN Code Example 1.2


```R
## Example 
# ---
# KNN Code Example 2
# ---
# 

# Import ggplot2 because diamonds dataset is in ggplot2 package
library(ggplot2)

# Loading the diamonds dataset
diamonds
 
# Storing it as data frame
dia <- data.frame(diamonds)

# Creating a random number equal 90% of total number of rows
ran <- sample(1:nrow(dia),0.9 * nrow(dia))
 
# The normalization function is created
nor <-function(x) { (x -min(x))/(max(x)-min(x))   }
 
# Normalization function is applied to the dataframe
dia_nor <- as.data.frame(lapply(dia[,c(1,5,6,7,8,9,10)], nor))
 
# The training dataset extracted
dia_train <- dia_nor[ran,]
 
# The test dataset extracted
dia_test <- dia_nor[-ran,]

# The 2nd column of training dataset because that is what we need to predict about testing dataset
# also convert ordered factor to normal factor
dia_target <- as.factor(dia[ran,2])
 
# The actual values of 2nd couln of testing dataset to compaire it with values that will be predicted
# also convert ordered factor to normal factor
test_target <- as.factor(dia[-ran,2])
 
# Running the knn function
library(class)
pr <- knn(dia_train,dia_test,cl=dia_target,k=20)
 
# Creating the confucion matrix
tb <- table(pr,test_target)
 
# Checking the accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tb)


```


```R
## Challenge
# ---
# Repeat the kNN classification above by using another value of k, and compare the accuracy of this new model to the one above. 
# Make sure to use the same training and test data to avoid any biases in the comparison.
# ---
# OUR CODE GOES BELOW 
# 
pr2 <- knn(dia_train,dia_test,cl=dia_target,k=15)
 
# Creating the confucion matrix
tb <- table(pr2,test_target)
 
# Checking the accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tb)



```


```R
## Challenge 
# ---
# Train a linear model using 10-fold cross-validation and then use it to predict the 
# median value of owner-occupied homes in Boston from the Boston dataset as described above. 
# ---
# OUR CODE GOES BELOW 
# 

# Importing Mass package
library(MASS)

# Previewing first few rows of the dataset
head(Boston)

# Now train a linear model below
boston_model <- train(medv ~ ., Boston,
method = 'lm',
trControl = trainControl(method = 'cv', number=10, verboseIter=FALSE))

boston_model

summary(boston_model)

# Check RMSE
pred <- predict(boston_model, Boston)

error <- pred - Boston$medv
error

rmse <- sqrt(mean(error^2))
rmse


```

#### KNN Code Example 1.3


```R
## Example 
# ---
# KNN Code Example
# ---
# OUR CODE GOES BELOW 
# 

# Let's preview the dataset
head(airquality)


```


```R
# Our classification task will involve predicting the month of the year when a set of values of Ozone, Solar.R, Wind and Temp are given.
# Our dataset has first 4 numeric attributes which will be used as predictors. 5th attribute is “Month” which will act as our Class Attribute. 
# Last attribute is “Day” of the month, which we can ignore and hence, will be removed during preprocessing of data.

# Let’s remove “Day” attribute from the dataset.
airquality$Day<- NULL
head(airquality)


```


```R
# We will find predictors that have missing values. We then need to impute those missing values(NA) with their monthly average
# (just to keep it simple, there are other methods though!).
# Applying the function anyNA() on all columns of airquality dataset
col1<- mapply(anyNA,airquality) 
col1
```


```R
# The output shows that only Ozone and Solar.R attributes have NA i.e. some missing value.
# Impute monthly mean in Ozone by running the code shown below
for (i in 1:nrow(airquality)){
  if(is.na(airquality[i,"Ozone"])){
    airquality[i,"Ozone"]<- mean(airquality[which(airquality[,"Month"]==airquality[i,"Month"]),"Ozone"],na.rm = TRUE)
  }

col2<- mapply(anyNA,airquality) 
col2

```


```R
## Your turn now: Challenge 
# ---
# Impute monthly mean in Solar.R
# ---
# OUR CODE GOES BELOW
#

for (i in 1:nrow(airquality)){
  if(is.na(airquality[i,"Ozone"])){
    airquality[i,"Ozone"]<- mean(airquality[which(airquality[,"Month"]==airquality[i,"Month"]),"Ozone"],na.rm = TRUE)
  }
```


```R
# Normalizing the predictor attributes so that no particular attribute has more impact on clustering algorithm than others.
normalize<- function(x){
  return((x-min(x))/(max(x)-min(x)))
}

# Replacing contents of dataset with normalized values
airquality[,1:4]<- normalize(airquality[,1:4]) 



```


```R
# Seperating Class Attribute from rest of the dataset
class<- data.frame("month"=airquality$Month)
names(class)= "Month"

# Removing "Month" from airquality
airquality[,5]<- NULL 
head(airquality)



```


```R
# Creating Training and Test data subsets
# Since classification is a type of Supervised Learning, we would require two sets of data i.e. Training and Testing Data (80:20 ratio). 
# We will now divide the dataset into two subsets. Our knn classification model would then be trained using subset “airquality.train” 
# and tested using “airquality.test”. Since the airquality dataset is sorted by “Months” by default, we will first jumble the data rows 
# and then take subset.

# Required to reproduce the results
set.seed(999) 
rnum<- sample(rep(1:153))

# Randomizing "airquality" dataset
airquality<- airquality[rnum,] 

# Applying same randomization on "class" attribute
class<- as.data.frame(class[rnum,]) 

airquality.train<- airquality[1:130,]
airquality.train.target<- class[1:130,]
airquality.test<- airquality[131:153,]
airquality.test.target<- class[131:153,]

# Applying k-NN classification algorithm.
# No. of neighbours are generally square root of total number of instances
neigh<- round(sqrt(nrow(airquality)))+1 

# Applying the knn algorithm
model<- knn(train = airquality.train,  test = airquality.test, cl=airquality.train.target, k=neigh) 




```


```R
# Visualizing classification results
table(airquality.test.target, model)



```


```R
# Calculating the Accuracy
mean(airquality.test.target== model)


```


```R
## Challenge 
# ---
# If the accuracy is less that 0.50, try and see if we can get a better accuracy by changing 
# the value of “k”(by increasing or decreasing)
# ---
# 
```
