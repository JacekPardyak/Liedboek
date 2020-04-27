# library(readxl)
# res<- data.frame()
# for (i in c(1999:2019)) {
#   print(i)
#   tmp <- read_excel(paste0("Anal/TOP-2000-",i,".xlsx"))
#   names(tmp) <- c("NR.","TITEL","ARTIEST","JAAR")
#   tmp$LIJST <- i
#   res <- rbind(res,tmp)
# }
# write.csv(res, "./Anal/TOP-2000.csv", row.names = F)


TOP_2000 <- read.csv("./Anal/TOP-2000.csv", encoding = "UTF-8")
TOP_2000$KEY <- paste(TOP_2000$TITEL, TOP_2000$ARTIEST, sep = "_")
TOP_2000_KEYS <- unique(TOP_2000[,c("KEY", "JAAR")])

artists <- c("Bløf", "André Hazes", "Suzan & Freek", "Boudewijn de Groot",
                "Marco Borsato", "Guus Meeuwis", "De Dijk", "Klein Orkest",
                "Paul de Leeuw", "Diggy Dex", "Acda & De Munnik", "Davina Michelle",
                "Jeroen van Koningsbrugge", "Herman van Veen", "Wim Sonneveld",
                "Nick & Simon", "Doe Maar", "Maggie Macneal", "Frank Boeijen Groep",
                "Rob De Nijs", "Mannenkoor Karrespoor", "Frans Halsema", "Snelle",
                "Robert Long", "Kenny B.", "Jeroen van der Boom", "Glennis Grace",
                "Nielson", "Miss Montreal", "Lange Frans", "Gerard Cox", "Fluitsma & Van Tijn",
                "Claudia De Breij", "Danny Vera", "Ilse DeLange", "Armin van Buuren", "Racoon",
                "The Scene", "Ramses Shaffy", "Liesbeth List", "Maaike Ouboter", "Stef Bos",
                "The Amazing Stroopwafels", "Gorki", "Clouseau", "Kensington",
             "Dotan", "Duncan Laurence", "Common Linnets", "Ruth Jacott",
             "Lange Frans & Thé Lau", "René Klijn", "Hans de Booij")

# ? Volumia 
# "Frans Halsema" "Voor haar" refernece to Borsato

res <- rep(FALSE, nrow(TOP_2000_KEYS))
for (artist in artists) {
  res <- res | sapply(TOP_2000_KEYS$KEY, function(x) grepl(artist, x, fixed = TRUE)) 
}
TOP_2000_KEYS_NL <- TOP_2000_KEYS[res,]

# ----------------------------------
# calculate the score

score <- function(x, y){
  #ind = 3
  #x <- TOP_2000_KEYS_NL$KEY[ind]
  #y <- TOP_2000_KEYS_NL$JAAR[ind]
  life = 60
  print(x)
  tmp <- data.frame(LIJST = seq(from = y, to = y + life - 1),
                    KEY = x, stringsAsFactors = F)
  tmp <- merge(tmp, TOP_2000, all.x = TRUE)
  for (i in c(max(y,1999):2019)) {
    k <- which(grepl(i, tmp$LIJST))
   if (is.na(tmp[k,"NR."])) tmp[k,"NR."] <- 2001
  }
  tmp[is.na(tmp$NR.), "NR."] <- as.integer(mean(tmp$NR., na.rm = T))
  as.integer(mean(tmp$NR., na.rm = T))
}


TOP_2000_KEYS_NL$NR. <- mapply(function(x,y) score(x,y), TOP_2000_KEYS_NL$KEY,
                               TOP_2000_KEYS_NL$JAAR)
TOP_2000_KEYS_NL <- TOP_2000_KEYS_NL[order(TOP_2000_KEYS_NL$NR., decreasing = F),]

TOP_2000_KEYS_NL$NR. <- c(1:nrow(TOP_2000_KEYS_NL))
