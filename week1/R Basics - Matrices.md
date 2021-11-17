
# Matrices

A matrix is a two dimensional data structure that is similar to a vector but additionally contains the dimension attribute.

## 1. Creating

When creating a matrix, the last two arguments to matrix tell it the number of rows and columns the matrix should have.


#### 1.1 Matrix Code Example

You can use the byrow=TRUE argument to create a matrix by rows instead of by columns as shown below:



```R
## Example 
# ---
# Question: Let's create a matrix mymat
# ---
# 


mymat <- matrix(1:12,4,3)

# And then print out mymat
# ---

print(mymat)

```

#### 1.2 Matrix Code Example


```R
## Example 
# ---
# Question: Let's use the byrow=TRUE argument to create a matrix 
# by rows instead of by columns as shown below
# ---

mymat <- matrix(1:12,ncol=3,byrow=TRUE)

# And then print out the mymat variable below


print(mymat)

mymat2 <- matrix(1:16, ncol=4, byrow=TRUE)

print(mymat2)



```

## 2. Naming

#### 2.1 Matrix Naming Code Example


```R
## Example 
# ---
# In order to remember what is stored in a matrix, you can add the names of the columns and rows. 
# This will also help you to read the data as well as select elements from the matrix.
# ---
# Question: Lets create the vectors kenya, ethiopia and chad
# ---
# OUR CODE GOES BELOW
# 


kenya <- c(460.998, 314.4) 
ethiopia <- c(290.475, 247.900) 
chad <- c(309.306, 165.8)


# then create a matrix geography_matrix
# ---
# 


geography_matrix <- matrix(c(kenya, ethiopia, chad), nrow = 3, byrow = TRUE)



# Uncomment the following two vectors; location and countries which will be used for naming
# ---
#

location <- c("Lat", "Long")
countries <- c("Kenya", "Ethiopia", "Chad")

# Then also uncomment the line below and so as to name the columns with location
# ---
# 

colnames(geography_matrix) <- location

# More on uncomment also the following line so as to name the rows with countries
# ---
#

rownames(geography_matrix) <- countries

# And lastly print out geography_matrix
# ---
#

geography_matrix


```


```R
## Challenge 
# ---
# Question: Create a matrix family with column names Name, Age, Gender and Occupation. 
# Populate it with 5 your own family members.
# ---
# OUR CODE GOES HERE
# 

first <- c('Rayo', 22, 'M', 'Student')
second <- c('Shosho', 69, 'F', 'Self-Employed')
third <- c('Wallie', 41, 'M', 'Self Employed')
fourth <- c('Washo', 45, 'F', 'Banker')


# Column names

fam_matrix = matrix(c(first, second, third, fourth), nrow = 4, byrow = TRUE)

column_names_fam = c('Name', 'Age', 'Gender', 'Occupation')

colnames(fam_matrix) = column_names_fam


print(fam_matrix)

```

## 3. Adding a Column

You can add a row to a matrix using the rbind() function.

#### 3.1 Adding a Column Code Example


```R


## Example 
# ---
# Question: Create the matrix x below
# ---
# OUR CODE GOES BELOW
# 

x <- matrix(1:9, nrow = 3)
x

# Then add a column as shown
# ---
# 


cbind(x, c(1, 2, 3))


```


```R
## Challenge 
# ---
# Question: Add a column residence to your fictional family matrix that you had created earlier
# ---
# OUR CODE GOES BELOW
# 

fam_matrix


cbind(fam_matrix, c('Kenya', 'kenya', 'US', 'UK'))

fam_matrix



```

## 4. Adding a Row

#### 4.1 Adding a Row Code Example


```R
## Example 
# ---
# Question: Creating a matrix x
# ---
# 
x <- matrix(1:9, nrow = 3)

# You can also add a row using the cbind() function
# ---
# 

rbind(x,c(1,2,3))


```


```R
## Challenge 
# ---
# Question: Add a fictional character to your fictional family matrix
# ---
# OUR CODE GOES BELOW
# 

fam_matrix = rbind(fam_matrix, c('Jermaine', 23, 'M', 'Electrician'))

fam_matrix

```

## 5. Selecting a Matrix

To select an element of a matrix, one needs to specify both the row and the column as shown:


```R
## Example 
# ---
# Question: Select the following matrix
# ---
# OUR CODE GOES BELOW
# 
x <- matrix(1:9, nrow = 3)

# Select the elements from the above matrix 
# By uncommenting the following lines.
# ---
# 
# x[1,3] # select the element at 1nd row, 3rd column
# x[2, ] # the 2nd row
# x[ ,3] # the 3rd column


```


```R
## Challenge 
# ---
# Question: Select the last member of your family member 
# ---
# OUR CODE GOES BELOW
# 


fam_matrix[5, ]

```


```R
## Challenge 
# ---
# Question: Select the first member of your family member 
# ---
# OUR CODE GOES BELOW
# 


```

## 6. Operations


### Matrix addition &amp; subtraction

#### 6.1 Matrix Addition &amp; Subtraction Code Example


```R



## Example 
# ---
# Question: Matrix addition and subtract require the matrices to have the same dimensions. 
# Let's start by creating matrices x and y.
# ---
# OUR CODE GOES BELOW
# 
x <- matrix(c(3, 9, -1, 4, 2, 6), nrow = 2)
y <- matrix(c(5, 2, 0, 9, 3, 4), nrow = 2)

# Print matrix x below
# ---

x

# 

# Print the matrix y below
# 
y
# 

# Add the matrices and print out the result
# ---
#

z = x + y
z

# Subtract the matrices
# ---
# 

x - y

```

### Matrix Multiplication &amp; Division

#### 6.2 Matrix Multiplication &amp; Division Code Example


```R
## Challenge
# ---
# Question: Let's create two 2 x 3 matrices x and y
# ---
# OUR CODE GOES BELOW
# 
x <- matrix(c(3, 9, -1, 4, 2, 6), nrow = 2)
y <- matrix(c(5, 2, 0, 9, 3, 4), nrow = 2)

# And then multiply these matrices, assign the result to to the variable z
# ---
# 

z = x * y

# Now print out the matrix z
# ---
# 
z

# Lastly divide matrix x by y and assign the result to the variable z
# ---
#

z_new = x / y
z_new

```
