
## Decision Trees

Decision trees are versatile Machine Learning algorithm that can perform both classification and regression tasks. They are very powerful algorithms, capable of fitting complex datasets. 
A decision tree is a graph to represent choices and their results in form of a tree. The nodes in the graph represent an event or choice and the edges of the graph represent the decision rules or conditions. It is mostly used in Machine Learning and Data Mining applications using R.

Examples of use of decision tress is − predicting an email as spam or not spam, predicting of a tumor is cancerous or predicting a loan as a good or bad credit risk based on the factors in each of these. Generally, a model is created with observed data also called training data. 

#### Decision Tree Code Example 1.1

A great advantage of decision trees is that they make a complex decision simpler by breaking it down into smaller, simpler decisions using divide-and-conquer strategy. They basically identify a set of if-else conditions that split data according to the value if the features.




```R
## Example 
# ---
# Decision Tree Code Example 1.1

Sonar <- read.csv('~/Documents/R/supervised-learning/datasets/sonar_csv.csv', header=TRUE)

# ---
# 
head(Sonar)

m <- rpart(Class ~ ., data = Sonar,
           method = "class")

rpart.plot(m)


```


```R
p <- predict(m, Sonar, type = "class")
table(p, Sonar$Class)


```

Decision trees choose splits based on most homogeneous partitions, and lead to smaller and more homogeneous partitions over their iterations.

An issue with single decision trees is that they can grow, and become large and complex with many branches, with corresponds to over-fitting. Over-fitting models noise, rather than general patterns in the data, focusing on subtle patterns (outliers) that won’t generalise.

To avoid over-fitting, individual decision trees are pruned. Pruning can happen as a pre-condition when growing the tree, or afterwards, by pruning a large tree.

Pre-pruning: stop growing process, i.e stops divide-and-conquer after a certain number of iterations (grows tree at certain predefined level), or requires a minimum number of observations in each mode to allow splitting.

Post-pruning: grow a large and complex tree, and reduce its size; nodes and branches that have a negligible effect on the classification accuracy are removed.

#### Decision Tree Code Example 1.2


```R
## Example 
# ---
# Decision Tree Code Example 1.2
# ---
# 
set.seed(12)
model <- train(Class ~ .,
               data = Sonar,
               method = "ranger") 
model


```


```R
plot(model)


```

The main hyperparameters is mtry, i.e. the number of randomly selected variables used at each split. 2 variables produce random models, while 100s of variables tend to be less random, but risk over-fitting. caret automate the tuning of the hyperparameter using a grid search, which can be parametrised by setting tuneLength (that sets the number of hyperparameter values to test) or directly defining the tuneGrid (the hyperparameter values), which requires knowledge of the model.


```R
# Training the model
model <- train(Class ~ .,
               data = Sonar,
               method = "ranger",
               tuneLength = 5)


set.seed(42)
myGrid <- expand.grid(mtry = c(5, 10, 20, 40, 60),
                     splitrule = c("gini", "extratrees"),
                     min.node.size = 10)
model <- train(Class ~ .,
               data = Sonar,
               method = "ranger", 
               tuneGrid = myGrid,
               trControl = trainControl(method = "cv",
                                       number = 5,
                                       verboseIter = FALSE))

# Printing the model
model


```


```R
# Plotting the model
plot(model)


```

Challenge 1 : Experiment with training a random forest model as described above, by using 5-fold cross validation, and setting a tuneLength of 5.




#### Decision Tree Code Example 1.3


```R
## Example 
# ---
# Decision Tree Code Example 1.3
# ---
# 

# We will use the R in-built data set named readingSkills to create a decision tree. 
# It describes the score of someone's readingSkills if we know the variables "age","shoesize","score" 
# and whether the person is a native speaker or not.

# Load the party package. It will automatically load other
# dependent packages.
library(party)

# Print some records from data set readingSkills.
head(readingSkills)


```


```R
# Creating the input data frame.
input.dat <- readingSkills[c(1:105),]

# Creating the tree.
  output.tree <- ctree(
  nativeSpeaker ~ age + shoeSize + score, 
  data = input.dat)

# Plotting the tree.
plot(output.tree)


```


```R
# From the decision tree shown above we can conclude that anyone whose readingSkills score is less than 
# 38.3 and age is more than 6 is not a native Speaker.
# 

```
