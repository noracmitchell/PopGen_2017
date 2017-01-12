## working directories in R

getwd() # function to get current working directory
setwd() # to change/set working directory

## Data structures

# read.csv() to read in our data"

cats <- read.csv(file = "data/feline-data.csv")
cats

# read.csv(), read.table()

cats$weight
cats$coat

cats$weight + 2
cats$coat + 2

## Data types in R - 5 data types
typeof(cats$weight)

typeof(3.14) #double
typeof(1L) # integer
typeof(1+1i) # complex
typeof(TRUE) # logical
typeof('banana') # character


cats2 <- read.csv("data/feline-data-2.csv")

typeof(cats2$weight)
cats2 + 2

cats2
typeof(cats2$weight)


rm(cats2)


# Vectors
# every element in a vector must be of the same data type

my_vector <- vector(length = 3)

another_vector <- vector(mode = 'character', length = 3)
another_vector

## str() function
str(another_vector)
str(cats$weight)


## in a data frame, columns are vectors
## columns in a data frame have to be of the same data type

str(cats)

# c() combine function
combine_vector <- c(2, 6, 3)
combine_vector

quiz_vector <- c(2, 6, '3')
str(quiz_vector)

# type coercion
# R forces everything in the vector to be the same data type

coercion_vector <- c('a', TRUE)
coercion_vector
str(coercion_vector)

# specific order for type coercion in R
# -> is transformed into
# logical -> integer -> neric -> complex -> character

character_vector <- c('0', '2', '4')
character_vector
character_coerced_to_numeric <- as.numeric(character_vector)
character_coerced_to_numeric
typeof(character_coerced_to_numeric)
str(character_coerced_to_numeric)

# as.logical, as.character, as.numeric, etc. 

# c() can add things to an existing vector

ab_vector <- c('a', 'b')
ab_vector
combine_example <- c(ab_vector, 'c')
combine_example


# series of #s

mySeries <- 1:10
mySeries
seq(10)


## asking questions about vectors
sequence_example <- seq(10)
head(sequence_example, n = 2)
tail(sequence_example, n = 5)
length(sequence_example)

names_example <- 5:8
names(names_example) <- c("a", "b", "c", "d")
names_example

str(names_example)

x <- 1:26
x
x * 2
x
x <- x * 2
x
names(x) <- LETTERS
x

## data frames
str(cats$weight)
str(cats$coat)

coats <- c('tabby', 'tortoiseshell', 'tortoiseshell', 'black', 'tabby')
coats
str(coats)

CATegories <- factor(coats)
str(CATegories)

typeof(coats)
typeof(CATegories)

mydata <- c("case", "control", "control", "case")
factor_ordering_example <- factor(mydata)
factor_ordering_example <- factor(mydata, levels = c("control", "case"))
str(factor_ordering_example)

# factors are integers under the hood

# lists

list_example <- list(1, "a", TRUE, 1+4i)
list_example

another_list <- list(title = "Research Bazaar", numbers = 1:10, data = TRUE)
another_list

typeof(cats)

## a data frame is a special list where all of the vectors are the same length

another_vector
ab_vector[1]
ab_vector[2]

# data frame
cats[1]
cats[1 ,2 ]
cats
cats[ , 3]
cats[3, ]
cats[c(1,3),c(2,3)]

# matrix

# 2 dimensional, all of the same type

matrix_example <- matrix(0, ncol = 6, nrow = 3)
matrix_example

dim(matrix_example)
nrow(matrix_example)
ncol(matrix_example)

## Exploring Data Frames

cats

age <- c(2,3,5,12)

# cbind() column bind
cats <- cbind(cats, age)
nrow(cats)

age <- c(2,3,5)
cats <- cbind(cats, age)
cats

## add another observation, another cat

# use rbind() row bind
newRow <- list('tortoiseshell', 3.3, TRUE, 9)
cats <- rbind(cats, newRow)
cats

levels(cats$coat)
levels(cats$coat) <- c(levels(cats$coat), 'tortoiseshell')
cats <- rbind(cats, list('tortoiseshell', 3.3, TRUE, 9))
cats

cats[-4, ]

na.omit(cats)

cats <- na.omit(cats)
cats

cats <- rbind(cats, cats)
cats

rownames(cats) <- NULL
cats


df <- data.frame(first = "Nora", last = "Mitchell", Number = 5)
df

newRow <- list(first = "James", last = "Mickley", Number = 12)

df <- rbind(df, newRow)

df$first <- as.character(df$first)
df$last <- as.character(df$last)

df <- data.frame(first = "Nora", last = "Mitchell", lucky_number = 11)
df
str(df)

df$first <- as.character(df$first)
df$last <- as.character(df$last)

str(df)

mickles <- list(first = "James", last = "Mickley", lucky_number = 12)

str(mickles)

df <- rbind(df, mickles)
df

gapminder <- read.csv(file = "data/gapminder-FiveYearData.csv")
gapminder

length(gapminder)
ncol(gapminder)
nrow(gapminder)
dim(gapminder)

colnames(gapminder)

str(gapminder)
