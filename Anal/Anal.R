Sys.setlocale("LC_ALL","English_Netherlands")


TOP_2000 <- read.csv("./Anal/TOP-2000.csv", encoding = "UTF-8")
TOP_2000$KEY <- paste(TOP_2000$TITEL, TOP_2000$ARTIEST, sep = "_")
TOP_2000_KEYS <- unique(TOP_2000[,c("KEY", "JAAR")])

artists <- c("Bløf", "André Hazes", "Suzan & Freek", "Boudewijn de Groot",
                "Marco Borsato", "Guus Meeuwis", "De Dijk", "Klein Orkest",
                "Paul De Leeuw", "Diggy Dex", "Acda & De Munnik", "Davina Michelle",
                "Jeroen Van Koningsbrugge", "Herman Van Veen", "Wim Sonneveld",
                "Nick & Simon", "Doe Maar", "Maggie Macneal", "Frank Boeijen Groep",
                "Rob De Nijs", "Mannenkoor Karrespoor", "Frans Halsema", "Snelle",
                "Robert Long", "Kenny B.", "Jeroen van der Boom", "Glennis Grace",
                "Nielson", "Miss Montreal", "Lange Frans", "Gerard Cox", "Fluitsma & Van Tijn",
                "Claudia De Breij", "Danny Vera", "Ilse DeLange", "Armin van Buuren", "Racoon",
                "The Scene", "Ramses Shaffy", "Liesbeth List", "Maaike Ouboter", "Stef Bos",
                "The Amazing Stroopwafels", "Gorki", "Clouseau", "Kensington",
             "Dotan", "Duncan Laurence", "Common Linnets", "Ruth Jacott",
             "Lange Frans & Thé Lau", "René Klijn", "Hans De Booij", "Vader Abraham",
             "Drs. P", "Normaal", "Harry Klorkestein", "Benny Neyman",
             "Van Dik Hout", "Candy Dulfer & Dave Stewart", "Ten Sharp",
             "2 Unlimited", "Within Temptation", "Anouk", "Tiesto", "Anneke Grönloh",
             "Jacques Brel", "Ben Cramer", "Joost Nuissl", "Louis Neefs",
             "Astrid Nijgh", "Reinhard Mey", "Willy Alberti", "Conny Vandenbos",
             "VOF de Kunst", "Armand", "Rowwen Hèze", "Milow", "Volumia!", "Danny de Munk",
             "Jan Smit", "Het Goede Doel", "Rene Froger")

# ?  Gordon - wielu artystów w tą nazwą
# "Jacques Brel"  Laat me niet alleen (Ne me quitte pas) - Belgian guy śpiewał po francusku i niderlandzku
# Borsato - włoski, niderlandzki
# "Frans Halsema" "Voor haar" refernece to Borsato

# wyjątki w kodowaniu:
# Hèze
# scène
# jusqu'a - jusqu'à
# BLØF
# Belgie

res <- rep(FALSE, nrow(TOP_2000_KEYS))
for (artist in artists) {
  res <- res | sapply(TOP_2000_KEYS$KEY, function(x) grepl(artist, x, fixed = TRUE)) 
}
TOP_2000_KEYS_NL <- TOP_2000_KEYS[res,]

# ----------------------------------
# calculate the score

score <- function(x, y){
  #ind = 61
  #x <- TOP_2000_KEYS_NL$KEY[ind]
  #y <- TOP_2000_KEYS_NL$JAAR[ind]
  life = 61
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
