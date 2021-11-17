
# Operations

Operators are those symbols which tell the computer to perform precise mathematical or logical manipulations. R programming is loaded with built in operators some of which are shown below:

## 1. Arithmetic Operators

We are going to learn about arithmetic operators using the following examples.

#### 1.1 Addition Code Example


```R
## Example
# ----
# Let's first assign the variable x the value 5 and also assign the variable y the value 16. 
# ---
# 
x <- 5 
y <- 16 

## Then, we add x and y together using the addition operator +
# ---
#
x + y

```

#### 1.2 Subtraction Code Example 


```R
## Challenge 
# ---
# Question: Using our understanding in the above example, 
# let's now subtract x from y using the operator - below
# ---
# OUR CODE GOES BELOW
# 

x - y

#### 1.3 Multiplication Code Example


```R
## Challenge 
# ---
# Question: Multiply x and y using the operator * below
# ---
# OUR CODE GOES BELOW
# 

x * y

#### 1.4 Division Code Example


```R
## Challenge 
# ---
# Question: Divide x by y using the operator / below
# ---
# OUR CODE GOES BELOW
# 

x / y

#### 1.5 Modulus Code Example


```R
## Challenge 
# ---
# Question: Get the modulo of y and x using the operator %% and print it out below
# ---
# OUR CODE GOES BELOW
# 

```

#### More Challenges


```R
## Challenge
# ---
# Find the addition, substraction, multiplication, division, modulus of a and b when a = 10 and b = 4.
# Hint: Before we even start formulating a solution, 
# lets assign the value 10 to variable a and assign the value 4 to a variable b.
# ---
# OUR CODE GOES BELOW
# 
a <- 10
b <- 

# Let's begin adding a and b as shown below
# ---
# OUR CODE GOES BELOW 
# 
a + b

# Then substracting a and b as shown below
# ---
# OUR CODE GOES BELOW 
# 


# Then multiplying a and b
# ---
# OUR CODE GOES BELOW 
# 


# Performing division of a and b
# ---
# OUR CODE GOES BELOW 
# 


# And lastly the modulo of a and b
# ---
# OUR CODE GOES BELOW 
# 

```


```R
## Challenge 
# ---
# Question: Fix the code below to get an output of 1. 
# Hint: You can change the values of the variables to get the output.
# ---
# OUR CODE GOES BELOW
# 

c <- 10
d <- 2
c %% d

```


```R
## Challenge
# ---
# Question: Fix the code below to get an output of 25. 
# Hint: You can change one of the operators to the subtraction operator - and get an answer
# ---
# OUR CODE GOES BELOW
# 

a <- 5
b <- 4
b - a + 10 / 2 * a * 3 + 10 + 59

```

## 2. Relational Operators  

We are now going to learn about relational operators.

#### 2.1 Less than Code Example


```R
## Example 
# ---
# Question: Applying less than operator using the x and y variables
# Hint: For the following examples, we will use the previous assigned values of x and y using the operator <. 
# ---
# OUR CODE GOES BELOW 
# 

# Lets find what x is
x

# Lets find what y is
y

# And now find out whether x is less than y. 
x < y

```

#### 2.2 Greater than Code Example


```R
## Challenge 
# ---
# Question: Find out whether x is greater than y using the Greater than operator > 
# ---
# OUR CODE GOES BELOW
#

```

#### 2.3 Less than or Equal to Code Example


```R
## Challenge
# ---
# Question: Find whether x is less than or equal to y using the less than or equal to operator <=
# ---
# OUR CODE GOES BELOW
# 


```

#### 2.4 Greater than or Equal to Code Example


```R
## Challenge 
# ---
# Question: Find out below whether x is greater than or equal to y using the greater than or equal to operator >= below
# ---
# OUR CODE GOES BELOW
# 


```

#### 2.5 Equal to Code Example


```R
## Challenge 
# ---
# Question: Find out whether y is equal to y using the equal to operator ==, below
# ---
# OUR CODE GOES BELOW
# 


```

#### 2.6 Not Equal to Code Example


```R
## Challenge 
# ---
# Question: Find out whether x is not equal to y using the not equal to operator !=, below
# ---
# OUR CODE GOES BELOW
# 


```

## 3. Logical Operators 

Logical operators are applicable only to vectors of type logical, numeric or complex. Each element of the first vector is compared with the corresponding element of the second vector. 
The result of comparison is a Boolean value.


#### 3.1 Element-wise Logical AND operator Code Example 


```R
## Example
# ---
# Question: Lets create two vectors v and t
# ---
# 
v <- c(3,1,TRUE,2+3i) 
t <- c(4,1,FALSE,2+3i) 

# Then use the element-wise logical and operator & as follows
v&t


```

#### 3.2 Element-wise Logical OR operator Code Example 


```R
## Example 
# ---
# Question: Create again two vectors v and t
# ---
# 
v <- c(0,0,TRUE,2+2i) 
t <- c(0,3,TRUE,2+3i) 

# Then use the element-wise logical or operator | below
v|t


```

#### 3.3  The Logical OR operator Code Example 


```R
## Example 
# ---
# Question: Let create two vectors v and t
# ---
# 
v <- c(3,1,TRUE,2+3i) 
t <- c(4,1,FALSE,2+3i) 

# This time, use the logical not operator ||
v||t


```

#### 3.4  The Logical AND operator Code Example 


```R
## Example
# ---
# Question: Create two vectors v and t then use the logical AND operator
# ---
# 
v <- c(3,1,TRUE,2+3i) 
t <- c(4,1,FALSE,2+3i) 

# OUR CODE GOES BELOW
# ---
# 


```

## 4. Assignment Operators 

#### 4.1  Left Assignment Operator Code Example 


```R
## Example 
# ---
# Question: Create variables v1, v2 and v3, assigning them with vectors 
# using the left assignment operators v1, v2 and v3
# ---
# 
v1 <- c(3,1,TRUE,2+3i) 
v2 <<- c(3,1,TRUE,2+3i) 
v3 = c(3,1,TRUE,2+3i) 

# Then we print out v1 below
v1 

# And print out v2 below
# ---
# OUR CODE GOES BELOW
# 


# And now print out v3 below
# ---
# OUR CODE GOES BELOW
# 


```

#### 4.2  Right Assignment Operator Code Example 


```R
## Challenge
# ---
# Question: Use the right asignment operators to assign vectors to the variables v1 and v2 
# ---
# 
c(3,1,TRUE,2+3i) -> v1 
c(3,1,TRUE,2+3i) ->> v2 

# Then print out variable v1 and see what has happened
# ---
# OUR CODE GOES HERE
# 


# And also print out variable v2
# ---
# OUR CODE GOES HERE
# 


```

## 5. Variable Assignment  

Variables can be assigned values using leftward, rightward and equal to operator.


#### 5.1  Right Assignment Operator Code Example 


```R
## Example
# ---
# Question: Use the right assignment operators to assign the vectors to the respective variables as shown below;
# ---
# OUR CODE GOES HERE
# 
variable.1 = c(3,4,5,6)  
variable.2 <- c("Hello"," there")  
c(TRUE,2) -> variable.3 

# Uncomment the following lines to see what has happened
# --- 
# 
# variable.1 
# variable.2
# variable.3


```

## 6. Basic Data Types

There are several basic data types in R which are of frequent occurrence. 

#### 6.1 Numeric Data Type Code Example


```R
## Example 
# ---
# Question: To learn about the numeric data type, 
# lets assign the value 62.4 to the variable m as shown below
# ---
# OUR CODE GOES BELOW
# 
m = 62.4       

# Print out the variable's value below
# ---
# OUR CODE BELOW
# 


```

Assigning a decimal value for any variable m, m will become a numeric type as shown above.


#### 6.2 Integer Data Type Code Example


Any integer in R is created by invoking the as.integer() function as shown below:



```R
## Example 
# ---
# Let's now create an integer 3 and assign it to the variable n
# ---
# 
n = as.integer(3)  

# Then print n below so as to see what is stored in n
# ---
# 
n                     

# Using another example, lets create convert 3.14 to an interger 
# and assign the converted value to the variable p
# ---
# OUR CODE GOES BELOW
#


# And print out the value p so as to see the value that has been assigned to p
# ---
# OUR CODE GOES BELOW
#



```

#### 6.3 Complex Data Type Code Example



```R
## Example 
# ---
# We can also assign a complex number and assign it to the variable k just as shown below
# ---
# 
k = 1 + 2i   

# Now lets print out k below
# ---
# OUR CODE GOES BELOW
# 


```

#### 6.4 Logical Data Type Code Example

A logical value is created when comparison between variables is done as shown:


```R
## Example 
# ---
# To create a logical value we are first going to create two variables x and y variables
# ---
#
x = 4;  y = 6      

# Now we check whether x is greater than y
# ---
# 
z = x > y         

# And then print out the logical value below
# ---
# OUR CODE GOES BELOW
#


```

#### 6.5 Character Data Type Code Example

A character value can also be created and stored in a variable g.


```R
## Example 
# ---
# Convert the value 62.48 to a string and store it a variable g
# ---
#
g = as.character(62.48)  

# Then print the character string g
# ---
# OUR CODE GOES BELOW
#


```
