## working directories in R

getwd() # function to get current working directory
setwd() # to change/set working directory

## Data structures
## make data file called feline-data.csv

# make this in a text editor, or go to file -> new file -> text file
# enter data as comma separated, no spaces, make sure you hit return after last line

# coat,weight,likes_string
# calico,2.1,1
# black,5.0,0
# tabby,3.2,1
#

# save the file as feline-data.csv in the /data subfolder of your project


# read.csv() to read in our data"

cats <- read.csv(file = "data/feline-data.csv") # note the extension with the folder name first, since we're currently in /my_project, not /my_project/data
cats

# read.csv(), read.table() is similar

# use the $ operator to look at an individual column
cats$weight 
cats$coat

cats$weight + 2 # do math with a column
cats$coat + 2 # tabby + 2 is nonsense!

## Data types in R - 5 data types
# all data is interpreted as one of these 5 types!
typeof(cats$weight)

typeof(3.14) #double
typeof(1L) # integer: has an L after the number
typeof(1+1i) # complex
typeof(TRUE) # logical
typeof('banana') # character

# cats2 data file, make a new document

# coat,weight,likes_string
# calico,2.1,1
# black,5.0,0
# tabby,3.2,1
# tabby,2.3 or 2.4,1
#

cats2 <- read.csv("data/feline-data-2.csv")

typeof(cats2$weight) # now it's an integer...what?
cats2 + 2
cats2

rm(cats2)

# Vectors
# every element in a vector must be of the SAME DATA TYPE

my_vector <- vector(length = 3) # default is to type logical

another_vector <- vector(mode = 'character', length = 3) # use mode to make it character, for example
another_vector

## str() function to look at the structure of an object
str(another_vector)
str(cats$weight)

## in a data frame, COLUMNS are VECTORS
## columns in a data frame have to be of the same data type

str(cats)

# c() combine function
combine_vector <- c(2, 6, 3)
combine_vector

quiz_vector <- c(2, 6, '3') # what type will this be?
str(quiz_vector)

# type coercion
# R forces everything in the vector to be the same data type

coercion_vector <- c('a', TRUE)
coercion_vector
str(coercion_vector) # character

# specific order for type coercion in R
# -> is transformed into
# logical -> integer -> neric -> complex -> character

character_vector <- c('0', '2', '4')
character_vector
character_coerced_to_numeric <- as.numeric(character_vector) # make the vector numeric!
character_coerced_to_numeric
typeof(character_coerced_to_numeric)
str(character_coerced_to_numeric)

# different as functions to make different types
# as.logical, as.character, as.numeric, etc. 

# c() can add things to an existing vector

ab_vector <- c('a', 'b') # makes vector with just a and b
ab_vector
combine_example <- c(ab_vector, 'c') # adds c to the vector
combine_example

# series of #s

mySeries <- 1:10 # produces series of 1 2 3 4 5 6 7 8 9 10
mySeries
seq(10) # same output; seq() generates regular sequences

## asking questions about vectors
sequence_example <- seq(10)
head(sequence_example, n = 2) # head() looks at the top n # of elements
tail(sequence_example, n = 5) # tail() looks at bottom n # of elements
length(sequence_example) # length() gets length of object

# you can also add names to your elements
names_example <- 5:8
names(names_example) <- c("a", "b", "c", "d") # names() refers to the names, this code assigns values to the names
names_example
names(names_example)

str(names_example) # ineger...?


# socrative question
x <- 1:26 # vector of numbers 1 through 26
x
x <- x * 2 # reassign x to be 2 * x
x
names(x) <- LETTERS # assigns the names of x to be the pre-defined vector LETTERS
x

# could also do names(x) <- c("A", "B", "C", ... "X", "Y", "Z") but this is a lot of typing!

## data frames
# look at structure of individual columns
str(cats$weight)
str(cats$coat)

coats <- c('tabby', 'tortoiseshell', 'tortoiseshell', 'black', 'tabby') # make new vector coats
coats
str(coats) # character

CATegories <- factor(coats) # use factor() to make my character vector into a factor data structure
# factors are used for categorical data
# factors are actually INTEGERS under the hood! They are ordered/numbered alphabetically
str(CATegories)

typeof(coats) # character
typeof(CATegories) # factor

# maybe you don't want to order them alphabetically
mydata <- c("case", "control", "control", "case") # make character vector
factor_ordering_example <- factor(mydata) # make it into a factor vector, case defaults to 1L, control to 2L
factor_ordering_example <- factor(mydata, levels = c("control", "case")) # use this to make control 1L and case 2L, not alphabetical! define the levels
str(factor_ordering_example)

# factors are integers under the hood

# lists
# lists can contain different data types
list_example <- list(1, "a", TRUE, 1+4i)
list_example

# lists can contain elements with different lengths
another_list <- list(title = "Research Bazaar", numbers = 1:10, data = TRUE)
another_list

typeof(cats) # data frames are lists!!!

## a data frame is a special list where all of the vectors are the same length

# aside, use the square brackets to look at indexing!
another_vector
ab_vector[1] # looks at first element
ab_vector[2] # looks at second element

# data frame: two-dimensional
cats[1] # looks at slice

# for two-dimensional things, [rows, columns]
cats[1, 2] # first row, second column of cats
cats

# leave a blank to select all rows or columns
cats[ , 3] # all rows, column 3
cats[3, ] # row 3, all columns
cats[c(1,3),c(2,3)] # can use c() combine also: rows 1 and 3, columns 2 and 3

# matrix
# 2 dimensional, all of the same type

matrix_example <- matrix(0, ncol = 6, nrow = 3) # create matrix using matrix() function
matrix_example

dim(matrix_example) # shows number of rows, number of columns in matrix
nrow(matrix_example) # shows number of rows
ncol(matrix_example) # shows number of columns

## Exploring Data Frames

## adding new columns or rows to your data frame

cats

age <- c(2,3,5,12) # make new vector containg ages

# cbind() column bind
cats <- cbind(cats, age) # oops, something went wrong!
nrow(cats) # cats has only 3 obs, age has 4. remember data frames contain column vectors of EQUAL LENGTH

age <- c(2,3,5) # only 3 elements
cats <- cbind(cats, age) # use cbind() to bind cats and age together
cats

## add another observation, another cat as a row!
# remember rows/observations are lists!

# use rbind() row bind
newRow <- list('tortoiseshell', 3.3, TRUE, 9) # use list() to create a new list! 
# make sure you put character values in quotes!
cats <- rbind(cats, newRow) # use rbind() to add newRow to cats
# uh-oh, what happened!
cats # NA vallue for coat, but weight, likes_string, and age are ok

# cats$coat is a factor, and R only allows for pre-existing levels of factors
# tortoiseshell is a new level, so R doesn't recognize it!

levels(cats$coat) # use levels() to look at current levels of the factor
levels(cats$coat) <- c(levels(cats$coat), 'tortoiseshell') # use c() to add tortoiseshell as another factor level to the pre-existing ones
cats <- rbind(cats, list('tortoiseshell', 3.3, TRUE, 9)) # now this should work!
cats

cats[-4, ] # use - before row # to get rid of a row

na.omit(cats) # use na.omit() to get rid of any observations with NA values

cats <- na.omit(cats) # don't forget you need to reassign it to cats to save it!
cats

cats <- rbind(cats, cats) # append data frames to each other
cats # row names don't make sense

rownames(cats) <- NULL # use rownames() to rename the rows, NULL here 
cats

# Advanced Challenge!
# make a new data frame with your first name, last name, and lucky #
# add a new row with your partner's info
# add a new column with answer to the question "Is it time for a coffee break? / day 1 to be over?"

# example solution
# use data.frame() to make new data frame
# args column_name = "value", etc.
df <- data.frame(first = "Nora", last = "Mitchell", Number = 11)
df # data frame with one row, three columns

newRow <- list(first = "James", last = "Mickley", Number = 12) 
# use list() to make a new row with James' info

df <- rbind(df, newRow) # oops! 
str(df) # first and last are factors, need to either add a factor level or...

# convert first and last to characters instead of factors using as.character()
df$first <- as.character(df$first)
df$last <- as.character(df$last)
str(df) # now they're characters, not factors

## we added a row with missing info!
df <- na.omit(df)
df

df <- rbind(df, newRow) # now use rbind() to bind original df with new row/list
df

## read in the gapminder dataset
gapminder <- read.csv(file = "data/gapminder-FiveYearData.csv")
gapminder # too big to show, we ran out of room in our console!

length(gapminder) # length() of data frame is # of columns
ncol(gapminder) # ncol() number of columns
nrow(gapminder) # nrow() number of rows
dim(gapminder) # dim() number of rows, number of columns

colnames(gapminder) # names of the rows

str(gapminder) # str() shows that it's a data frame, info for all of our columns too!

## That's a wrap on day 1! Thanks!
