# Naming columns in a dataframe
# using function colnames
#
# Example: mtcars
# (from R help)
#
# Motor Trend Car Road Tests
# Description
# The data was extracted from the 1974 Motor Trend US magazine, and comprises
# fuel consumption and 10 aspects of automobile design and performance for 32
# automobiles (1973–74 models).

#Prints all the column names of this dataset
colnames(mtcars)

# [1] "mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear" "carb"


#
# Task 1: Rename the column mpg to milesPerGallon (see my slide on Camel
# notation)
#

# Remember the colnames function returns a vector (See)
colnames(mtcars) <- c("milesPerGallon","cyl","disp","hp","drat","wt","qsec","vs",
                      "am","gear","carb")