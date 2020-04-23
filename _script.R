library(bib2df)

path = c("./book.bib")
bib <- bib2df(path)

write.table(bib, "./data/_songs.csv")

bib$AUTHOR
# Write to .bib file:
df2bib(bib, file = "songggs.bib")

# Use `append = TRUE` to add lines to an existing .bib file:
# df2bib(bib, bibFile, append = TRUE)
require(tibble)
cc <- tibble(a = 1:3, b = 1)
class(cc)
?tibble

?bib2df

bib <- read.csv("./data/_songs.csv", sep = ";", encoding = "UTF-8", stringsAsFactors = F)
bib <- as_tibble(bib)
df2bib(bib, "./songggs1.bib")

path = c("./songs.bib")
bib <- bib2df(path)
bib$KEY[2] <- "Żyj"
bib$KEY
df2bib(bib, file = "songggs.bib")
