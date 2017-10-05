# https://www.analyticsvidhya.com/blog/2016/05/data-table-data-frame-work-large-data-sets/

library(data.table)

#creating a dummy data table
DT <- data.table( ID = 1:50,
                  Capacity = sample(100:1000, size = 50, replace = F),
                  Code = sample(LETTERS[1:4], 50, replace = T),
                  State = rep(c("Alabama","Indiana","Texas","Nevada"), 50))

#simple data.table command
DT[Code == "C", mean(Capacity), State]

DT[Code == "D"]
DT[, mean(Capacity), by = State]
DT[Code == "A", mean(Capacity)]


### Why data.table instead of data.frame ###

# fread() is faster than read.csv() because, read.csv() tries 
# to first read rows into memory as character and then tries to 
# convert them into integer and factor as data types. On the other 
# hand, fread() simply reads everything as character.

# writing the files using data.table is much faster than write.csv().
# This packages provides fwrite() function enabled with parallelised fast writing ability. 

