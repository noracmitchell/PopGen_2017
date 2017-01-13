# Introduction to R

# R is a calculator
1 + 100

# R also follows order of operations
# highest to lowest precedence
# parentheses ()
# exponents ^ **
# division /
# multiplication *
# addition +
# subtraction -

3 + 5 *2

(3 + 5) * 2

# mathematical functions

# functions R 

# functions have the following syntax: function_name(args = args)
# sin() 
sin(1)
log(1) # natural logarithm
log10(10) # base-10 log
exp(0.5) # e ^ 

## Comparing things

1 == 1 # equality 
1 != 2 # inequality
1 < 2 # less than
2 > 1 # greater than
1 <= 1 # less than or equal to
1 >= 1 # greater than or equal to
3 <= 1 # returns FALSE
3<= # it's nice to have spaces

# when comparing #s, it's best to not use ==
# all.equal()
all.equal(3.14, 3.14)

# variables
# assign values to variables using the assignment operator <-
# 

x <- 1/40
x
(x <- 1/40) # use parentheses to assign value AND show output in the console

# you can do math, use functions with variables
log(1/40)
log(x)

x <- 100
x <- x + 1 # to update a variable, you can include the variable in the right-hand
x

# variable names can contain letters, number, underscores, and periods

# periods.between.words
# underscores_between_words
# camelCaseToSeparateWords

# Cannot start with a number, no dashes, can't start with symbols

# these WILL NOT work
x2 <- 5
2x <- 5
x-2 <- 5
$2 <- 5


x = 1/40

# socrative question
mass <- 47.5
age  <- 122
mass <- mass * 2.3
age <- age - 20

age

# Vectorization
# R can make vectors as well, can assign vectors as values to a variable, and can do math with them!
1:5
x <- 1:5
x
2^x

# R can do functions and math with vectors!! So powerful.

# Managing your environment
# ls() lists all of the objects loaded
ls()

# you can also delete object using rm()
rm(x)

rm(list = ls()) # this removes everything
# note that the = is used for arguments within a function!

rm(list <- ls()) # does NOT work

# R packages 

installed.packages() # check what packages are installed
install.packages("packagename") # install a package

library(ggplot2) # load a package, must do this to actually use it in an R session!

# remove objects one at a time
rm(mass)
rm(age)

# same time
rm(mass, age)

# remove everything
rm(list = ls())


## how to seek help in R!
# opens up help page in lower right hand window

?ggplot
help(ggplot)

# vignettes: detailed how-tos and examples

vignette(package = "ggplot2") # check what vignettes are available for a package
vignette("ggplot2-specs") # open up a specific vignette by name

# Google and/or stack overflow are great places to look when you have trouble with your code!

## dput() writes your data object to a file to recreate it
?dput

# sessionInfo() outpus all of the info for you current session
sessionInfo()

# getting help when you can't remember function name, use two ??
??krustal

# In order to access a package, need to load it!
# using library(packagename)
# else, you won't be able to use its functions
# including the help documentation

library(ggplot2)

## Project Management with RStudio

# File -> New Project -> New Directory -> Empty Project
# make subfolders within your project
# /data for raw data: best to keep raw data as is!
# /cleaned_data for raw data files
# /src for scripts: everything should be reproducible!
# /docs for text documents
# /results for results
# etc. 
