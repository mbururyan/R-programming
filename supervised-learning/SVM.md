
# Supervised Learning with R - SVM

## Example 


```R
## Example 
# ---
# Create an svm model that predicts the presence of heart disease in a patient.
# ---
# Dataset url = http://bit.ly/HeartdiseaseDataset
# ---
# OUR CODE GOES BELOW

heart <- read.csv('http://bit.ly/HeartdiseaseDataset', header=FALSE)
# ---
# 
head(heart)
```


```R
# We first install the caret package. 
# This package will be very helfpul in providing us with 
# direct access to various functions for training our model
# with various machine learning algorithms such 
# as KNN, SVM, Decision Tree, Linear Regression etc.
# ---
# 
install.packages('caret')
```


```R
# We then load our dataset as shown below
# The ‘sep’ attribute indicates that the data is stored in a CSV or Comma Separated Version.
# ---
# 
heart <- read.csv("http://bit.ly/HeartdiseaseDataset", sep = ',')
```


```R
# We check the structure of the dataframe through the function str()
# ---
# 
str(heart)
```


```R
# Previewing our dataset 
# ---
# 
head(heart)
```


```R
# Next we split the data into training set and testing set. 
# NB: The training set will be used for model building while the testing set for model evaluation.
# ---
# - The “y” parameter takes the value of variable according to which data needs to be partitioned. 
# In our case, target variable is at V14, so we are passing heart$V14
# - The “p” parameter holds a decimal value in the range of 0-1. It’s to show the percentage of the split. 
# We are using p=0.7. It means that data split should be done in 70:30 ratio. 
# So, 70% of the data is used for training and the remaining 30% is for testing the model.
# - The “list” parameter is for whether to return a list or matrix. 
# We are passing FALSE for not returning a list
# ---
# 
intrain <- createDataPartition(y = heart$V14, p= 0.7, list = FALSE)
training <- heart[intrain,]
testing <- heart[-intrain,]
```


```R
# We check the dimensions of out training dataframe and testing dataframe
# ---
# 
dim(training); 
dim(testing);
```


```R
# We then clean the data using the anyNA() method that checks for any null values.
# ---
#  
anyNA(heart)
```


```R
# Then check the summary of our data by using the summary() function
# ---
#  
summary(heart)
```


```R
# From our output above, we can see that the values of the various variables are not standardized. 
# For example, the V14 variables, which is our target variable, it holds only 2 values, either 0 or 1.
# This should be a categorical variable. To convert these to categorical variables, we need to factorize them.
# The following code will convert the training data frame’s “V14” column to a factor variable.
# ---
# 
training$target = as.factor(training$target)


class(training$target)
```


```R
# Before we train our model we will need to control all the computational overheads. 
# We will implement this through the trainControl() method. 
# This will allow us to use the train() function provided by the caret package. 
# ---
# The trainControl method will take three parameters:
# a) The “method” parameter defines the resampling method, 
# in this demo we’ll be using the repeatedcv or the repeated cross-validation method.
# b) The next parameter is the “number”, this basically holds the number of resampling iterations.
# c) The “repeats ” parameter contains the sets to compute for our repeated cross-validation. 
# We are using setting number =10 and repeats =3
# ---
# 

trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)

svm_Linear <- train(target ~., data = training, method = "svmLinear",
trControl=trctrl,
preProcess = c("center", "scale"),
tuneLength = 10,
na.action=na.exclude)

```


```R
# We can then check the reult of our train() model as shown below
# ---
# 
svm_Linear
```


```R
# We can use the predict() method for predicting results as shown below. 
# We pass 2 arguements, our trained model and our testing data frame.
# ---
# 
test_pred <- predict(svm_Linear, newdata = testing)
test_pred
```


```R
# Now checking for our accuracy of our model by using a confusion matrix 
# ---
# 
confusionMatrix(table(test_pred, testing$V14))

```

The above example was borrowed from the following reading: https://www.edureka.co/blog/support-vector-machine-in-r/#SVM%20Use%20Case

## Challenge 


```R
## Challenge 
# ---
# Using R build an SVM model to determine whether a student will default on their loan.
# ---
# Dataset url = http://bit.ly/StudentDefaultDataset
# ---
# 

loan <- read.csv('http://bit.ly/StudentDefaultDataset')
```

```R

head(loan)

# Change y to factor

#Check datatype
class(loan$default )

#change
loan$default = as.factor(loan$default)
class(loan$default )

#encode default column and student column to 1 & 0
loan$default <- ifelse(loan$default == 'No', 0, 1)
loan$student <- ifelse(loan$student == 'No', 0, 1)


table(loan$student)
table(loan$default)


# split the data into train set and testing set

trainer <- createDataPartition(
y=loan$default,
p=0.8,
list=FALSE
)

training_data <- loan[trainer,]
testing_data <- loan[-trainer,]


# Build model




```

