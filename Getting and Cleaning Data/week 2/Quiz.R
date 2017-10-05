## 1
library(httr)
library(jsonlite)

oauth_endpoints("github")

myapp = oauth_app("github", key = "", secret = "")

github_token = oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken = config(token = github_token)

req = GET("https://api.github.com/users/jtleek/repos", gtoken)
con = content(req)
json_obj = jsonlite::fromJSON(toJSON(con))
json_obj[json_obj$name=="datasharing","created_at"]



## 2
library(sqldf)

acs = read.csv("2.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")
sqldf("select distinct AGEP from acs")



## 3
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
html_code = readLines(con)
nchar(html_code[c(10,20,30,100)])



## 5
x = read.fwf(file="5.for", skip=4, widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
sum(x[,4])