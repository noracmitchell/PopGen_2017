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
1 <= 1
1 >= 1
3 <= 1
3<=1

# when comparing #s, it's best to not use ==
# all.equal()
all.equal(3.14, 3.14)

# variables

x <- 1/40
x
(x <- 1/40)

# you can do math, use functions with variables
log(1/40)
log(x)

x <- 100
x <- x + 1
x

# variable names can contain letters, number, underscores, and periods

# periods.between.words
# underscores_between_words
# camelCaseToSeparateWords

# Cannot start with a number, no dashes, can't start with symbols

x2 <- 5
2x <- 5
x-2 <- 5
$2 <- 5

# assignment operator <- 

x = 1/40

mass <- 47.5
age  <- 122
mass <- mass * 2.3
age <- age - 20

age

# Vectorization

1:5
x <- 1:5
x
2^x

# R can do functions and math with vectors!! So powerful.

# Managing your environment
# ls()
ls()

# you can also delete object using rm()
rm(x)

rm(list = ls())
rm(list <- ls())

# R packages 

installed.packages()
install.packages("packagename")

library(ggplot2)

# one at a time
rm(mass)
rm(age)

# same time
rm(mass, age)

# everything
rm(list = ls())


## how to seek help in R!

?ggplot
help(ggplot)

# vignettes

vignette(package = "ggplot2")
vignette("ggplot2-specs")

## dput() writes your data object to a file to recreate it
?dput

# sessionInfo()
sessionInfo()

# getting help when you can't remember function name
??krustal

# In order to access a package, need to load it!
# using library(packagename)
# else, you won't be able to use its functions
# including the help documentation

library(ggplot2)

## Project Management with RStudio