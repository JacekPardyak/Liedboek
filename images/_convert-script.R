# create svg
files <- list.files("./images/", pattern = ".txt", full.names = T)

# only txt files modified in last 24 hours
vec <- file.info(files)$ctime  > Sys.time() - 24*60*60
files <- files[vec]

for (file in files) {
file.out <- gsub(".txt", ".svg", file)
tmp <- readLines(file)
tmp <- gsub(".*,","", tmp)
tmp <- gsub("\".*","", tmp)

tmp <- rawToChar(jsonlite::base64_dec(tmp))

writeLines(tmp, file.out)
}


# export svg to pdf and png
files <- list.files("./images/", pattern = ".svg", full.names = T)
vec <- file.info(files)$ctime  > Sys.time() - 24*60*60
files <- files[vec]

for (file in files) {
  file.in <- file
  file.out <- gsub(".svg", ".png", file)
  command <- paste('inkscape  -e', file.out, " -w 60 -h 60", file.in, sep = " ")
  system(command)
  file.out <- gsub(".svg", ".pdf", file)
  command <- paste('inkscape  -A', file.out, file.in, sep = " ")
  system(command)
}

# ----------------------------------------------------------------------------------------------------------

files <- list.files("./images/youtube/", pattern = ".svg", full.names = T)

for (file in files) {
  file.in <- file
  file.out <- gsub(".svg", ".png", file)
  command <- paste('inkscape  -e', file.out, file.in, sep = " ")
  system(command)
  file.out <- gsub(".svg", ".pdf", file)
  command <- paste('inkscape  -A', file.out, file.in, sep = " ")
  system(command)
}


#-----------------------------------------------------------------------------------------------------------
# make favicon.ico
file.in <- c("./images/favicon/favicon.svg")
file.out <- gsub(".svg", ".png", file.in)
file.out <- c("favicon.png")
command <- paste('inkscape  -e', file.out, file.in, sep = " ")
system(command)

file.in <- file.out
file.keep <- c()
basis <- 16
for (i in c(1:4)) {
  number <- i * basis
  file.out <- gsub(".png", paste(".", number, ".png", sep = ""), file.in)
  command <- paste('magick convert', file.in, "-resize", paste(number, "x", number, sep = ""), file.out, sep = " ")
  system(command)
  file.keep <- paste(file.keep, file.out, sep = " ")
}
file.out <- gsub(".png", ".ico", file.in)
command <- paste('magick convert', file.keep, file.out, sep = " ")
system(command)

for (i in c(1:4)) {
  number <- i * basis
  file.out <- gsub(".png", paste(".", number, ".png", sep = ""), file.in)
  file.remove(file.out)
}

#-----------------------------------------------------------------------------------------------------------
# make cover page
file.in <- c("./images/cover/cover.svg")
file.out <- gsub(".svg", ".png", file.in)
file.out <- c("cover.png")

command <- paste('inkscape  -e', file.out, file.in, sep = " ")
system(command)
file.out <- gsub(".svg", ".pdf", file.in)
command <- paste('inkscape  -A', file.out, file.in, sep = " ")
system(command)

