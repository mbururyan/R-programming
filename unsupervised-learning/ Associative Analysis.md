
# R Programming - Associative Analysis

In this session, we will go through an example of association rules using the arules package. The documentation of this package can be found by visiting the following link: https://www.rdocumentation.org/packages/arules/versions/1.6-4. Below is an extract from its documentation:

"It provides the infrastructure for representing, manipulating and analyzing transaction data and patterns (frequent itemsets and association rules). It also provides interfaces to C implementations of the association mining algorithms Apriori and Eclat."


```R
# We first we install the required arules library 
#
install.packages("arules")
```


```R
# Loading the arules library
#
library(arules)
```


```R
# Loading our transactions dataset from our csv file
# ---
# We will use read.transactions fuction which will load data from comma-separated files 
# and convert them to the class transactions, which is the kind of data that 
# we will require while working with models of association rules
# ---
# 
path <-"http://bit.ly/GroceriesDataset"

Transactions<-read.transactions(path, sep = ",")
Transactions
```


```R
# Verifying the object's class
# ---
# This should show us transactions as the type of data that we will need
# ---
# 
class(Transactions)
```


```R
# Previewing our first 5 transactions
#
inspect(Transactions[1:5])
```


```R
# If we wanted to preview the items that make up our dataset,
# alternatively we can do the following
# ---
# 
items<-as.data.frame(itemLabels(Transactions))
colnames(items) <- "Item"
head(items, 10)    
```


```R
# Generating a summary of the transaction dataset
# ---
# This would give us some information such as the most purchased items, 
# distribution of the item sets (no. of items purchased in each transaction), etc.
# ---
# 
summary(Transactions)
```


```R
# Exploring the frequency of some articles 
# i.e. transacations ranging from 8 to 10 and performing 
# some operation in percentage terms of the total transactions 
# 
itemFrequency(Transactions[, 8:10],type = "absolute")
round(itemFrequency(Transactions[, 8:10],type = "relative")*100,2)
```


```R
# Producing a chart of frequencies and fitering 
# to consider only items with a minimum percentage 
# of support/ considering a top x of items
# ---
# Displaying top 10 most common items in the transactions dataset 
# and the items whose relative importance is at least 10%
# 
par(mfrow = c(1, 2))

# plot the frequency of items
itemFrequencyPlot(Transactions, topN = 10,col="darkgreen")
itemFrequencyPlot(Transactions, support = 0.1,col="darkred")
```


```R
# Building a model based on association rules 
# using the apriori function 
# ---
# We use Min Support as 0.001 and confidence as 0.8
# ---
# 
rules <- apriori (Transactions, parameter = list(supp = 0.001, conf = 0.8))
rules

```


```R
# We use measures of significance and interest on the rules, 
# determining which ones are interesting and which to discard.
# ---
# However since we built the model using 0.001 Min support 
# and confidence as 0.8 we obtained 410 rules.
# However, in order to illustrate the sensitivity of the model to these two parameters, 
# we will see what happens if we increase the support or lower the confidence level
# 

# Building a apriori model with Min Support as 0.002 and confidence as 0.8.
rules2 <- apriori (Transactions,parameter = list(supp = 0.002, conf = 0.8)) 

# Building apriori model with Min Support as 0.002 and confidence as 0.6.
rules3 <- apriori (Transactions, parameter = list(supp = 0.001, conf = 0.6)) 

rules2

rules3
```

In our first example, we increased the minimum support of 0.001 to 0.002 and model rules went from 410 to only 11. This would lead us to understand that using a high level of support can make the model lose interesting rules. In the second example, we decreased the minimum confidence level to 0.6 and the number of model rules went from 410 to 2918. This would mean that using a low confidence level increases the number of rules to quite an extent and many will not be useful.


```R
# We can perform an exploration of our model 
# through the use of the summary function as shown
# ---
# Upon running the code, the function would give us information about the model 
# i.e. the size of rules, depending on the items that contain these rules. 
# In our above case, most rules have 3 and 4 items though some rules do have upto 6. 
# More statistical information such as support, lift and confidence is also provided.
# ---
# 
summary(rules)
```


```R
# Observing rules built in our model i.e. first 5 model rules
# ---
# 
inspect(rules[1:5])


# Interpretation of the first rule:
# ---
# If someone buys liquor and red/blush wine, they are 90% likely to buy bottled beer too
# ---
```


```R
# Ordering these rules by a criteria such as the level of confidence
# then looking at the first five rules.
# We can also use different criteria such as: (by = "lift" or by = "support")
# 
rules<-sort(rules, by="confidence", decreasing=TRUE)
inspect(rules[1:5])

# Interpretation
# ---
# The given five rules have a confidence of 100
# ---
```


```R
# If we're interested in making a promotion relating to the sale of yogurt, 
# we could create a subset of rules concerning these products 
# ---
# This would tell us the items that the customers bought before purchasing yogurt
# ---
# 
yogurt <- subset(rules, subset = rhs %pin% "yogurt")
 
# Then order by confidence
yogurt<-sort(yogurt, by="confidence", decreasing=TRUE)
inspect(yogurt[1:5])
```


```R
# What if we wanted to determine items that customers might buy 
# who have previously bought yogurt?
# ---
# 
# Subset the rules
yogurt <- subset(rules, subset = lhs %pin% "yogurt")

# Order by confidence
yogurt<-sort(yogurt, by="confidence", decreasing=TRUE)

# inspect top 5
inspect(yogurt[15:19])
```

# Challenges


```R
## Challenge 1
# ---
# Question: Build an apriori model previewing the rules with the highest confidence interval
# given the following interval.
# ---
# Dataset url = http://bit.ly/AssociativeAnalysisDataset
# ---
# OUR CODE GOES BELOW
# 
```


```R
## Challenge 2
# ---
# Question: 
# ---
# Question: Build an apriori model previewing the rules with the highest confidence interval.
# given the following interval.
# ---
# OUR CODE GOES BELOW
# 
```
