
# Supervised Learning with R - Naive Bayes

## Example


```R
## Example 
# ---
# Build a naive bayes model in order to classify whether a patient is 
# either diabetic or normal given the following dataset. 
# ---
# Dataset url = http://bit.ly/Diabetesdataset
# ---
# OUR CODE GOES BELOW
# ---
# 
```


```R
# We will now install and load the required packages
# ---
#  
install.packages('tidyverse')
library(tidyverse)

install.packages('ggplot2')
library(ggplot2)

install.packages('caret')
library(caret)

install.packages('caretEnsemble')
library(caretEnsemble)

install.packages('psych')
library(psych)

install.packages('Amelia')
library(Amelia)

install.packages('mice')
library(mice)

install.packages('GGally')
library(GGally)

install.packages('rpart')
library(rpart)

install.packages('randomForest')
library(randomForest)
```


```R
# Loading our dataset
# ---
# 
data<- read.csv("http://bit.ly/Diabetesdataset")

```


```R
# Looking at the structure of our data
# ---
# 
str(data)

```


```R
# Previewing our data
# ---
# 
head(data)

```


```R
# Understanding our dataset
# ---
# 
describe(data)

```


```R
# We convert the output variable into a categorical variable
# ---
#  
data$Outcome <- factor(data$Outcome, levels = c(0,1), labels = c("False", "True"))

```


```R
# We then clean our dataset by setting zero values to NA's
# ---
# 
data[, 2:7][data[, 2:7] == 0] <- NA

```


```R
# We visualize our dataset by checking how many missing values
# ---
# 
missmap(data)

```


```R
# We can learn from the above dataset that there are many missing values 
# thus removing them wouldn't be better options since we'd be left with a smaller dataset. 
# Thus we resort to performing imputations by using the mice package in R.
# ---
# 
# We use mice package to predict missing values
mice_mod <- mice(data[, c("Glucose","BloodPressure","SkinThickness","Insulin","BMI")], method='rf')
mice_complete <- complete(mice_mod)

```


```R
# We ransfer the predicted missing values into the main data set
# ---
# 
data$Glucose <- mice_complete$Glucose
data$BloodPressure <- mice_complete$BloodPressure
data$SkinThickness <- mice_complete$SkinThickness
data$Insulin<- mice_complete$Insulin
data$BMI <- mice_complete$BMI

```


```R
# Now checking whether there are still many missing values
# ---
# 
missmap(data)

```


```R
# Creating some visualisations to take a look at each variable
# ---
# Visualisation 1
# 
ggplot(data, aes(Age, colour = Outcome)) +
geom_freqpoly(binwidth = 1) + labs(title="Age Distribution by Outcome")

```


```R
# Visualisation 2
# ---
# 
c <- ggplot(data, aes(x=Pregnancies, fill=Outcome, color=Outcome)) +
geom_histogram(binwidth = 1) + labs(title="Pregnancy Distribution by Outcome")
c + theme_bw()

```


```R
# Visualisation 3
# ---
# 
P <- ggplot(data, aes(x=BMI, fill=Outcome, color=Outcome)) +
geom_histogram(binwidth = 1) + labs(title="BMI Distribution by Outcome")
P + theme_bw()

```


```R
# Visualisation 4
# ---
# 
ggplot(data, aes(Glucose, colour = Outcome)) +
geom_freqpoly(binwidth = 1) + labs(title="Glucose Distribution by Outcome")

```


```R
# Visualisation 5
# ---
# 
ggpairs(data)

```


```R
# Splitting data into training and test data sets
# ---
# 
indxTrain <- createDataPartition(y = data$Outcome,p = 0.75,list = FALSE)
training <- data[indxTrain,]
testing <- data[-indxTrain,]
 
```


```R
# Checking dimensions of the split
# ---
#
prop.table(table(data$Outcome)) * 100
prop.table(table(training$Outcome)) * 100
prop.table(table(testing$Outcome)) * 100

```


```R
# Comparing the outcome of the training and testing phase
# ---
# Creating objects x which holds the predictor variables and y which holds the response variables
# ---
#
x = training[,-9]
y = training$Outcome
```


```R
# Loading our inbuilt e1071 package that holds the Naive Bayes function.
# ---
# 
library(e1071)
```


```R
# Now building our model 
# ---
# 
model = train(x,y,'nb',trControl=trainControl(method='cv',number=10))

```


```R
# Model Evalution
# ---
# Predicting our testing set
# 
Predict <- predict(model,newdata = testing )

# Getting the confusion matrix to see accuracy value and other parameter values
# ---
# 
> confusionMatrix(Predict, testing$Outcome )
```

The above example has been borrowed from the following reading. [Naive Bayes Reading](https://www.edureka.co/blog/naive-bayes-in-r/#Practical%20Implementation%20of%20Naive%20Bayes%20In%20R)

## Challenge 


```R
## Challenge 
# ---
# Using the R build a naive bayes model to determine whether a mushroom is edible.
# ---
# Dataset url = http://bit.ly/MushroomDataset
# ---
# 
# OUR CODE GOES BELOW
```
