##### R mrkdown!!! -> ut�nna n�zni )valami summary code)
# prettydoc weboldal
# name of the project/datasets
 # datasets:: (+tab) -> it will list the available tables in the stated datasets above

# ggplot
# ggplot(name of table) -> if you press f1, it will give description about the function
# ggplot(vmi) -> ut�nna n�zni mire val� val�j�ban
# kaggle.com or makeovermonday -> places for datasets downloading for practice

# installing package:eu
# choose dataset, jobbra lent package ablak, felugr� ablakon bearni: nyc... valami -> ehhez a packagehez tartozott
datasets::cars

library(nycflights13)
nycflights13::airports

df <- nycflights13::flights

# ment�s cvs �s rds file-ba. sep -> milyen karakterrel legyen elv�lasztva
write.csv(df, file = 'flights.csv',sep = '#')
saveRDS(df, 'flights.csv')
readRDS()

substring('mylongtest', 2, 4)
as.Date()
Sys.Date()

#ha egy function, mint if v. fun.. (snippet) + tab, automatikusan megalkotja

if (condition) {
  
}

name <- function(variables) {
  
}

for (i in 1:10) {
  print(paste('I process', i))
}
 # k�l�nbs�g between paste and paste0 is that paste0 does not leave space between the words
# a collapse be�rja a dolgok k�z� a k�rt karaktert

print(letters, collapse = "&")

# ctrl+shift+f (kijel�lt sz�veg vagy b�rmi) -> comment� alak�tja

for (i in 1:10) {
  print( i )
  print(Sys.time())
  Sys.sleep(5)
}


for (oneletter in letters) {
  print(oneletter)
  print(paste(toupper(oneletter),"1"))
  
}

sum(1==1:10)
if (1==1) {
  
}

for (mynumber in 1:10) {
  print(paste0('Iam processing: ', mynumber))
  
  if (mynumber%%2==0) {
    print(paste0('even'))
  }
}
  