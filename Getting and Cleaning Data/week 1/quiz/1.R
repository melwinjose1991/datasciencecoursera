## 1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "1.csv")
data = read.csv("1.csv")
sum(data$VAL==24, na.rm = TRUE)



## 3
library(openxlsx)
dat = read.xlsx("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", 
                sheet=1, colNames=TRUE, rows=18:23, cols=7:15)
sum(dat$Zip*dat$Ext,na.rm=T)



## 4
library(XML)
doc = xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", 
                   useInternalNodes = TRUE)
rootNode = xmlRoot(doc)
sum(xpathSApply(rootNode, "//zipcode", xmlValue)=="21231")



## 5
library(data.table)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "5.csv")
DT = fread("5.csv")
DT[, mean(pwgtp15), by=SEX]
