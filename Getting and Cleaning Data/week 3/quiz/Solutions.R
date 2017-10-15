### 1
data = read.csv("1.csv")
agricultureLogical = data$ACR==3 & data$AGS==6
which(agricultureLogical)



### 2
library(jpeg)
data = readJPEG("2.jpg", native=TRUE)
quantile(data, c(0.30, 0.80))



### 3
library(dplyr)
data_GDP = read.csv("3_GDP.csv")
data_Country = read.csv("3_Country.csv")

head(data_GDP)
head(data_Country)

data = merge(data_GDP, data_Country, by.x="CountryCode", by.y="CountryCode")
sorted = arrange(data, desc(Ranking))
head(sorted$Long.Name, 15)
tail(sorted$Long.Name, 15)


### 4
mean(as.numeric(data[data$Income.Group=="High income: OECD", "Ranking"]))
mean(as.numeric(data[data$Income.Group=="High income: nonOECD", "Ranking"]))


### 5
library(Hmisc)
data["Ranking_Bins"] = cut2(data$Ranking, g=5)
table(data$Ranking_Bins, data$Income.Group)
