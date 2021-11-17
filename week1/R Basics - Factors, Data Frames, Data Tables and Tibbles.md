
# Factors, Data Frames, Data Tables and Tibbles

## 1. Factors

As we have noted, factors are variables in R which take on a limited number of different values; such variables are often referred to as categorical variables. 

In a dataset, we can distinguish two types of variables: categorical and continuous.

In a categorical variable, the value is limited and usually based on a particular finite group. For example, a categorical variable can be countries, year, gender, occupation.
A continuous variable, however, can take any values, from integer to decimal. For example, we can have the revenue, price of a share, etc.

#### 1.1 Factors Code Example


```R

## Example 
# ---
# Question: Lets create a vector v
# ---
# OUR CODE GOES BELOW
# 
v <- c(1,3,5,8,2,1,3,5,3,5)

# Then determine whether this vector is a factor
# ---
#
is.factor(v)


```


```R
## Challenge 
# ---
# Question: Calculate the categorical distribution as shown and figure out why the given output
# ---
# OUR CODE GOES BELOW 
# 

factor(v)


```


```R
## Example 
# ---
# Question: Assign factor v to x and print out x 
# ---
# OUR CODE GOES BELOW 
# 
x <- factor(v)
x

```


```R

## Challenge 
# ---
# Question: Determine whether x is a factor below. 
# Hint: Just like the way you did when you were finding out whether vector v is a factor
# ---
# OUR CODE GOES BELOW
# 

factor(x)

```

#### 1.2 Factors Code Example 


```R
## Example 
# ---
# Question: First we create a vector as input, check whether its a factor, 
# apply the factor function to create a factor from the vector
# ---
# OUR CODE GOES BELOW
# 
data <- c("East","West","East","North","North","East","West","West","West","East","North")

# Then print out this vector
data

# Now, check whether this is a factor
is.factor(data)

# Then, apply the factor function to create a factor from the vector
factor_data <- factor(data) 

# Then see our newly created factor
factor_data 

# Check whether this is a factor
is.factor(factor_data)


```

#### 1.3 Factors Code Example 



```R
# Example  
# ---
# Creating a factor, determine and check the levels 
# ---
# OUR CODE GOES BELOW
# 
sex <- factor(c("male", "female", "female", "male"))

# Determining the levels
levels(sex)

# Then checking the number of levels using nlevels()
nlevels(sex)

# Sometimes, the order of the factors does not matter, other times you might want to specify the order 
# because it is meaningful (e.g., “low”, “medium”, “high”) or it is required by particular type of analysis. 
# Additionally, specifying the order of the levels allows us to compare levels:

food <- factor(c("low", "high", "medium", "high", "low", "medium", "high"))

# then print out levels of food
levels(food)


```

## 2. Data Frames

A data frame is used for storing data tables. Unlike a matrix in data frame each column can contain different modes of data.

### Creating a Dataframe 

#### 2.1 Creating a Dataframe Code Example


```R
## Example 
# ---
# Question: Lets create a data frame BMI
# ---
# OUR CODE GOES BELOW
# 
BMI <- data.frame( 
    gender  = c("Male", "Male","Female"), 
    height  = c(152, 171.5, 165), 
    weight  = c(81,93, 78), 
    Age     = c(42,38,26)
) 

# Then print it out below
BMI


```


```R
## Challenge 
# ---
# Question: Create a data frame family with column names Name, Age, Gender and Occupation. 
# Populate it with 5 your own family members.
# ---
# OUR CODE GOES BELOW
# 

fam_df <- data.frame(
  name = c('Rayo', 'Washo', 'Shosho'),
  age = c(22, 69, 45),
  gender = c('Male', 'Female', 'Female'),
  occupation = c('Student', 'Self Employed', 'Banker')
)

fam_df

```

### Selecting Elements From a DataFrame 

#### 2.2 Selecting Elements From a DataFrame Code Example


```R


## Example 
# ---
# Question: Selecting elements from the BMI dataframe
# ---
# OUR CODE GOES BELOW
# 

# selecting row 1 
BMI[1,]

# selecting rows 1 to 2
BMI[1:2, ] 

# selecting column 1 
BMI[,1]

# selecting column 1 to 2
BMI[,1:2 ] 

# selecting row 1 in column 2
BMI[1,2] 


```


```R
## Challenge 
# ---
# Question: Select the column 2 from the BMI dataframe
# ---
# OUR CODE GOES BELOW
# 
BMI[,2 ]

```


```R
## Challenge 
# ---
# Question: Select the second and third members of your family 
# ---
# OUR CODE GOES BELOW
# 

fam_df[2:3,]

```

### Sorting

#### 2.3 Sorting Code Example


```R
## Example 
# ---
# Question: Sort the BMI dataframe by using the order() function 
# ---
# 

# Sort in ascending order by gender
# ---
#

sorted_by_gender <- BMI[order(BMI$gender),]

# Print out sorted_by_gender below
# ---
#
sorted_by_gender

# Sort in descending order by weight
# ---
# 
sorted_by_weight <- BMI[order(-BMI$weight),]

# Print out sorted_by_weight below
# ---
# 
sorted_by_weight


# And sort in descending order by gender below
# ---
# OUR CODE GOES BELOW
# 

new_gender <- BMI[order(-BMI$height),]

new_gender


```

## 3. Data Tables

As we have mentioned, a data table provides an enhanced version of data.frames.

### Creating a Data Table 

The data.table R package is considered as the fastest package for data manipulation.

#### 3.2 Creating a Data Table Code Example


```R
## Example 
# ---
# Question: Create a data table DT
# ---
# 
DT = data.table(
  ID = c("b","b","b","a","a","c"),
  a = 1:6,
  b = 7:12,
  c = 13:18
)

# Load the data.table package
# ---
# 

# Then print it out to see what happens
# ---
# OUR CODE GOES BELOW
# 

DT

```

### Selecting Elements From a Data Table

#### 3.3 Selecting Elements From a Data Table Code Example


```R
## Example 
# ---
# Question: Select elements from the given datatable DT
# ---
# OUR CODE GOES BELOW
# 

# Selecting Row 1 
DT[1,]

# Selecting Rows 1 to 2
DT[1:2,] 

# Find out what happens when we print out the following statement 
DT[,1]

# Find out what happens when we print out the following statement
DT[,1:2] 

# And lastly find out what happens when we print out the following statement
DT[1,2] 

# Select the fourth and third rows from the data table
# ---
# OUR CODE GOES BELOW
# 


```

### Sorting a Data Table

#### 3.4 Sorting a Data Table Code Example


```R
## Example 
# ---
# Question: Sorting the datatable in ascending order by c 
# ---
# OUR CODE GOES BELOW
# 

# Performing the sort
# 
sorted_by_c <- DT[order(DT$c),]

# Printing out sorted_by_c
# ---
# OUR CODE GOES BELOW
# 

# Sort in descending order by b, uncommenting the line below
# ---
# 
# sorted_by_b <- DT[order(-DT$b),]

# Finally printing out sorted_by_b below
# ---
# OUR CODE GOES BELOW
# 


```

## 4. Tibbles

Tibbles are data frames, but they tweak some older behaviours to make life a little easier. They also have an enhanced print() method which makes them easier to use with large datasets containing complex objects

### Creating a Tibble

You can create a new tibble from individual vectors with tibble(). tibble() will automatically recycle inputs of length 1, and allows you to refer to variables that you just created, as shown below.

#### 4.1 Creating a Tibble Code Example


```R
## Example 
# ---
# Question: Create a tible tb
# ---
# OUR CODE GOES BELOW
# 

# First, we load the tibble package

library(tibble)

# Then create our tibble tb
tb <- tibble(
  x = 1:5, 
  y = 1, 
  z = x ^ 2 + y
)

# And finally print the created tibble 
# ---
# OUR CODE GOES BELOW
# 

tb
```

### Selecting a Tibble Code Example

#### 4.1 Selecting a Tibble Code Example


```R
## Example 
# ---
# Question: Find out what happens when we print the following 
# ---
# OUR CODE GOES BELOW
# 
tb[1,]
tb[1:2, ] 
tb[,1]
tb[,1:2 ] 

# Select the second and third rows
# ---
# OUR CODE GOES BELOW
# 


```

### Sorting a Tibble

#### 4.1 Sorting a Tibble Code Example


```R
## Example
# ---
# Question: Find out what happens when we sort by doing the following 
# ---
# 
sorted_by_1 <- tb[order(tb$z),]
sorted_by_1

sorted_by_2 <- tb[order(-tb$x),]
sorted_by_2

# Sort tb in ascending order by x below
# ---
# OUR CODE GOES BELOW
# 


```

