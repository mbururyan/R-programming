
# Lists and Vectors

## 1. Creating

### Lists

#### 1.1 Lists Code Example


```R
## Example 
# ---
# Lists are R objects which contain elements of different types 
# like numbers, strings, vectors, matrices, functions and lists too.
# ---
# Question: Create a list using the list() function
# ---
# OUR CODE GOES BELOW
# ---
#

alist <- list ("Red", "Blue", c(42,36,01), FALSE, 73.91, 128.6)


alist

```

# Now printing alist
# ---
# OUR CODE GOES BELOW
# 




### Vectors


```R
## Example 
# ---
# Question: Create vectors a, b and c 
# ---
# 
a <- c(1,2,5.3,6,-2,4)                   # numeric vector 
b <- c("one","two","three")              # character vector 
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE)  # logical vector

# Print out these vectors a, b and c
# ---
# OUR CODE GOES BELOW
# 

print(a)
print(b)
print(c)

```

## 2. Naming

### Lists

#### 2.1 Naming Lists Code Example


```R
## Example 
# ---
# The elements in a list can be given names which would allow one 
# to have access to those elements as shown below
# ---
# Question: Create a list containing a vector, a matrix and a list
# ---
# 

list_data <- list(c("Jan","Feb","Mar"), matrix(c(3,9,5,1,-2,8), nrow = 2), list("green",12.3)) 

# Giving names to the elements in the list
names(list_data) <- c("1st Quarter", "A_Matrix", "A Inner list") 

# Print the list list_data below
# ---
# OUR CODE GOES BELOW
# 

print(list_data)

```

### Vectors

#### 2.2 Naming Vectors Code Example


```R
## Example 
# ---
# You can give a name to the elements of a vector with the names() function as shown below
# ---
# 

a <- c("Serena Williams", "Tennis Player")

names(a) <- c("Name", "Profession")

# Then print out these vectors below
# ---
# OUR CODE GOES BELOW
# 

print(a)

a
```

## 3. Selection

### Lists

#### 3.1 List Selection Code Example


```R
## Example 
# ---
# Every element of the list can be accessed by the use of square brackets, 
# and by numeric indices or by the logical index or by using element names.:
# ---
# Question: Let's now create a list ls
# ---
# OUR CODE BELOW
# 
ls <- list( first = 2, second = 4, third = list( fourth = 3.2, fifth = 6.4 ) )

# And uncomment the following lines to find out what happens
# ---
# 
ls [1:3]
ls[-3]
ls [c ("first", "second")]

```

### Vectors

#### 3.1 Vector Selection Code Example


```R

## Example
# ---
# Create a numeric vector a 
# ---
# OUR CODE GOES BELOW
# 
a <- c(1,2,5.3,6,-2,4) 

# And select the 2nd and 3rd elements in the vector

a[c(2,3)]

a[c(4, 5)]

```

## 4. Adding

### Lists

#### 4.1 Adding Lists Code Example


```R
## Example  
# ---
# One can add elements only at the end of a list as shown
# ---
# Question: Create a list containing a vector and a matrix 
# ---
# OUR CODE GOES BELOW
# 
list_data <- list(c("Jan","Feb","Mar"), matrix(c(3,9,5,1,-2,8), nrow = 2))

# And add an element at the end of the list then print it out
# ---
# 
list_data[4] <- "New element" 

list_data[4]

list_data


```


```R
## Challenge
# ---
# Question: Create an empty list named months_of_the_years, 
# then add all 12 months of the year
# ---
# OUR CODE GOES BELOW
# 


```

### Vectors

#### 4.2 Adding Vectors Code Example


```R
## Example 
# ---
# Question: Vectors can be combined via the function c as shown
# ---
# OUR CODE GOES BELOW
# 

p = c(1, 2, 3)
q = c("aa", "bb", "cc")

# Then print out the combined vector
# ---
# Hint: Uncomment the line below
# 

 r = c(p, q)
 r


```

## Challenge
```R
 
# ---
# Question: Combine the following vectors and print out the result below
# ---
# OUR CODE GOES BELOW
# 
a <- c("Serena Williams", "Tennis Player") 
names(a) <- c("Name", "Profession")


c(a, names(a))

a

```


# Extra

```R

phone <- c('samsung', '100,000')

names(phone) <- c('brand', 'bei')

a

phone

```




