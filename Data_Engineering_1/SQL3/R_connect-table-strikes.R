install.packages("RMariaDB")
library(RMariaDB)
birdstrikesDb <- dbConnect(RMariaDB::MariaDB(), user='Eszter97', password='Ezegyjelszo1', dbname='firstdb', host='localhost')
