library(RMySQL)



ucsc_db = dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")
results = dbGetQuery(ucsc_db, "show databases;")
results
dbDisconnect(ucsc_db)




hg_19_db = dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")
all_tables = dbListTables(hg_19_db)
length(all_tables)
all_tables[1:5]

dbListFields(hg_19_db, "affyU133Plus2")
dbGetQuery(hg_19_db, "select count(*) from affyU133Plus2")



query = dbSendQuery(hg_19_db, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis = fetch(query)
quantile(affyMis)
dbClearResult(query)



dbDisconnect(hg_19_db)


