# Creating dataframes with tibble
# Need to use dplyr
library(dplyr)

#Instantiate the data frame
mydataframe <- data.frame()

row1 <- tibble( column1 = "1",
                column2 = "This is the first row")

row2 <- tibble( column1 = "2",
                column2 = "This is the first row")

mydataframe <- bind_rows(row1,row2)

# print the contents of this data frame in the console
mydataframe

# Should show something like this (row numbers ignored) :
# # A tibble: 2 x 2
# column1                 column2
# <chr>                     <chr>
#     1   1 This is the first row
#     2   2 This is the first row
