###################################
###################################
########                   ########
########   Data Science 3  ########
########       Lab 2       ######## 
########  7th Mar. 2023    ########
########                   ########
###################################
###################################


# Welcome to lab number 3. Today we'll be learning a few more 
# R/general programming concepts before moving onto lecture examples

########################################
####    Boolean logic, continued    ####
########################################

# the main logic operators in R are as follows:
# the NOT operator, !, turns TRUE into FALSE and vice versa
!TRUE
!FALSE
# the AND operator, &, returns TRUE only if elements on both sides of the operator are TRUE
1==1 & 2==1
# the inclusive OR operator, |, returns TRUE if EITHER of the elements are TRUE
1==1 | 2==1

# there is no operator for exclusive OR, but there is a function, xor()
xor(1==1 , 2==2)

# 1.1 
# mtcars is a database of cars with several variables such as horsepower, weight, number of cylinders etc.
data(mtcars)
head(mtcars)
# Using indexing (square brackets) and the & operator, write a line of code
# that selects only the rows of mtcars with at least 6 cylinders (mtcars$cyl >= 6) and horsepower of at least 110 (mtcars$hp >= 110). Remember to include all the columns.

### 1.2
# Now select only those rows with either high efficiency (miles per gallon (mpg) of at least 25) or low weight (wt <= 2.5)

#############################
####    If statements    ####
#############################

# The if() function will execute everything after it, either on the same line or in {} brackets,
# only if there is a TRUE boolean statement within the parentheses
x <- 5
if(x > 3) print ('This statement is true')
if(x-4==1){
  new_object <- c('this','statement','is','also','true')
  print(new_object)
}

### 2.1
# Write a function called probe, that takes two arguments, n and w.
# The function should return a character vector of length n, consisting of 'Water' and 'Land', sampled with probability w. (so probability of sampling 'Water' is w)
# If the p argument is not numeric, or if it is not between 0 and 1, the function should return the following message:
# "Please input a probability between 0 and 1"


# After the if statement we can put an else statement:
if(x-4>1){
  new_object <- c('this','statement','is','also','true')
  print(new_object)
}else{
  print('This is untrue')
}

# A simplified version of if()else is the following:
ifelse(x/2==7,print('Definitely true'),print('categorically false'))

##################################
####    Paste and strsplit    ####
##################################

# paste() and strsplit() can be used to join and separate
# character objects (strings), respectively. For example:

paste('Hello','world!', sep='_')
strsplit('Hello to you too. /My name is Ed.', split='/')

# You'll notice that strsplit returns a list. This allows us to vectorise the function:
strsplit(rownames(mtcars),split=' ')


#####################
####    Loops    ####
#####################

# Loops are algorithms that repeat a procedure over and over until they are instructed to stop.
# There are two main kinds:
# FOR loops iterate over a predetermined set (vector, list, etc)
fruits <- c('apple','banana', 'pineapple','mango','orange')
for(i in fruits){
  print(paste('My favourite fruit is',i,sep=': '))
}

useless_function <- function(n){
  for (i in 1:n){
    print(paste0(i,'. This number is: ', c('even','odd')[i%%2 +1]))
  }
}
useless_function(7)

### 4.1 
data(iris)

# Write a for loop that iterates over the column names of the iris dataset and print each together with the number of characters in the column name in parenthesis. Example output: Sepal.Length (12). To get the number of characters use the function nchar().
for (col_name in colnames(iris)) {
  # Print the column name and its number of characters in parenthesis
  cat(col_name, "(", nchar(col_name), ")\n")
}
# Next, WHILE loops continue to loop until the boolean statment in the defining parentheses, e.g.
x <- 0
while(x<100){
  print(x)
  x <- x+sample(1:20,1)
}

### 4.2 How many numbers do you need in the sequence 1*2*3*4*5*... before the product exceeds 10 million?
# Use a while loop to get the answer
# Set the initial product and count
product <- 1
count <- 0

# While the product is less than or equal to 10 million,
# multiply it by the next integer in the sequence and increase the count
while (product <= 10000000) {
  count <- count + 1
  product <- product * count
}

# Print the result
cat("The product exceeds 10 million after", count, "numbers in the sequence.")


###################################
####    Linear models intro    ####
###################################

# We can run an OLS linear model using lm()
# Inside the lm and other model functions we use formulas
# Formulas have the dependent variable on the left and the independent (predictor) variables on the right with a ~ in between
# Lets run a bivariate regression of car weight (in 1000 pounds/500 kg) on miles per gallon (1mpg = 1km/L)
model <- lm(mtcars$mpg ~ mtcars$wt)
library(stats)
summary(model)
### 5.1
# What does the Estimate for the (Intercept) number represent?
#The Estimate for the (Intercept) represents the expected or predicted mean
#value of the dependent variable (mpg in this case) when all independent 
#variables (wt in this case) are equal to zero.
#In the output of the summary() function for the linear regression model, 
#the Intercept is the value of the dependent variable when the independent
#variable(s) is zero. In this case, the Intercept has an estimated value of
#37.2851. This means that, according to the model, if a car has a weight of
#zero (which is not practically possible), then its expected or predicted 
#mean value of miles per gallon (mpg) is 37.2851. However, in practice, the
#Intercept may not have a meaningful interpretation, especially if the 
#independent variable(s) cannot logically be equal to zero.

#It's important to note that in the context of linear regression, the
#Intercept is only meaningful if the independent variable(s) have a 
#meaningful zero point. If the independent variable(s) do not have a meaningful zero point, the Intercept is not meaningful and should be interpreted with caution.
### 5.2
# What does the Estimate for the mtcars$wt number represent?
#The Estimate for the mtcars$wt variable in the linear regression model 
#represents the expected or predicted change in the mean value of the 
#dependent variable (mpg in this case) for a one-unit increase in the value
#of the independent variable (wt in this case).

#In the output of the summary() function for the linear regression model,
#the Estimate for mtcars$wt is -5.3445. This means that, according to the 
#model, for each one unit increase in weight (wt) of a car, the expected 
#or predicted mean value of miles per gallon (mpg) is expected to decrease
#by 5.3445 units, all other variables held constant.

#It's important to note that this interpretation assumes that the relationship
#between mtcars$mpg and mtcars$wt is linear and that other relevant 
#variables have been accounted for in the model. 
#Additionally, this interpretation applies to the range of data in the mtcars dataset and may not generalize to other populations or datasets.

### 5.3 
# Is the relationship between these two variables positive or negative? Why do you think that might be?
#The relationship between the mtcars$mpg and mtcars$wt variables in the linear 
#regression model is negative.
#This is indicated by the negative sign of the Estimate for mtcars$wt in 
#the output of the summary() function, which indicates that as the weight 
#of a car increases, the expected or predicted mean value of miles per 
#gallon (mpg) decreases.

#This negative relationship may be due to the fact that heavier cars 
#generally require more fuel to move the same distance as lighter cars, 
#all other factors held constant. This is known as the "fuel economy penalty" of heavier vehicles. Additionally, heavier cars may have larger engines, which can also contribute to lower fuel efficiency. Thus, it is not surprising to find a negative relationship between weight and miles per gallon in the mtcars dataset. However, it's important to note that this interpretation is based on the specific dataset used in this analysis and may not necessarily generalize to other populations or datasets.

### 5.4 What is the predicted average efficiency in miles per gallon of a 4000 pound (2000kg) car?
#using the regression formular ,mtcars$mpg = 37.2851 - 5.3445 * mtcars$wt
#Substituting mtcars$wt with 4000 pounds we get:
#mtcars$mpg = 37.2851 - 5.3445 * 4000
#mtcars$mpg = -21342.7149


# Let's transform the independent variable:
mtcars$wt_centred <- mtcars$wt - mean(mtcars$wt)


### 5.5
#compare the mean and variance of the new variable with the untransformed 
#variable. What do you notice?

#The code mtcars$wt_centred <- mtcars$wt - mean(mtcars$wt) creates a new 
#variable mtcars$wt_centred by subtracting the mean of the original mtcars$wt variable from each value of mtcars$wt.

#Comparing the mean and variance of the new variable with the original 
#variable can reveal some differences:
  
#Mean: The mean of the new variable mtcars$wt_centred will be close to zero
#by definition, since we subtracted the mean of mtcars$wt from each value. 
#In contrast, the mean of the original mtcars$wt variable will typically 
#not be zero.
#Variance: The variance of mtcars$wt_centred will generally be smaller 
#than the variance of the original mtcars$wt variable. 
#This is because subtracting the mean from each value reduces the spread of the values around the mean, and therefore the variance. However, the difference in variance between the original and centred variables will depend on the scale and distribution of the original variable.
#In summary, subtracting the mean from each value can shift the variable 
#so that its mean is zero, and reduce its variance. This can be useful for certain analyses, such as linear regression, where it can help to center the predictor variable around zero. However, it is important to note that this transformation will not change the shape of the distribution of the variable, and can also affect the interpretation of coefficients and other summary statistics in some cases.

### 5.6
# Run a new regression with new independent variable
model2 <- lm(mtcars$mpg ~ mtcars$cyl)
library(stats)
summary(model2)

# What do you notice about the estimates?
#We can see that the model includes only one independent variable, which is cyl (the number of cylinders in the car engine), and the dependent variable is mpg (miles per gallon).
#The regression output shows that:
#The intercept is estimated to be 37.8846, which means that the predicted average miles per gallon for a car with 0 cylinders is 37.8846. However, since a car cannot have 0 cylinders, this intercept may not have any practical meaning.
#The coefficient for cyl is estimated to be -2.8758, which means that for every one-unit increase in the number of cylinders, the predicted miles per gallon decreases by 2.8758 units. This coefficient is statistically significant (p-value < 0.001) and negative, indicating a negative relationship between the number of cylinders and miles per gallon.
#The model's R-squared value is 0.7262, which means that about 73% of the variation in miles per gallon can be explained by the number of cylinders in the car engine.
#Overall, we can conclude that the estimated coefficients indicate a strong negative relationship between the number of cylinders and miles per gallon, meaning that cars with more cylinders tend to have lower fuel efficiency.

#What is the interpretation of the (Intercept) estimate in this regression?
#In a linear regression model, the Intercept estimate represents the predicted value of the dependent variable (y) when all the independent variables (x) in the model are equal to zero.
#In the case of the regression model:
#The Intercept estimate is 37.8846, which means that the predicted miles 
#per gallon for a car with zero cylinders is 37.8846. However, this interpretation may not be meaningful in practice since cars cannot have zero cylinders. Therefore, the Intercept estimate is often used as a baseline reference point to interpret the effect of changes in the independent variable(s) on the dependent variable.

#In this model, we can interpret the Intercept estimate as the predicted 
#average miles per gallon for a car with a very small number of cylinders 
#(approaching zero) or as the miles per gallon that a car would achieve if all other factors affecting fuel efficiency were equal and the car had zero cylinders. However, it is important to note that this interpretation may not be practically relevant or realistic.

### 5.7
# Run the following code:
y <- mtcars$mpg
x <- cbind(1,mtcars$wt)

# A couple of functions for you to know:
# t() returns the transpose of any matrix
# solve() returns the inverse of any (invertible) matrix
# %*% is matrix multiplication
# with that in mind try to code the following expression in R:
# (x'x)^(-1) * (x'y)
# where ' means the transpose
# Run the code you have written. What do you find?

# calculate (x'x)^(-1) * (x'y)
x_inv <- solve(t(x) %*% x)
result <- x_inv %*% t(x) %*% y
#This code defines a matrix x , and a matrix y . We then use the solve() and %*% functions to calculate the expression (x'x)^(-1) * (x'y).
#The result should be a matrix, 
#representing the coefficient estimates for a linear regression with x as
#the predictor variables and y as the response variable. Note that the 
#specific values will depend on the values of x and y used.
