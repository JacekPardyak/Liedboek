# create svg
files <- list.files("./images/", pattern = ".txt", full.names = T)

for (file in files) {
file.out <- gsub(".txt", ".svg", file)
tmp <- readLines(file)
tmp <- gsub(".*,","", tmp)
tmp <- gsub("\".*","", tmp)

tmp <- rawToChar(jsonlite::base64_dec(tmp))

writeLines(tmp, file.out)
}


# export svg
files <- list.files("./images/", pattern = ".svg", full.names = T)

for (file in files) {
  file.in <- file
  file.out <- gsub(".svg", ".png", file)
  command <- paste('inkscape  -e', file.out, file.in, sep = " ")
  system(command)
  file.out <- gsub(".svg", ".pdf", file)
  command <- paste('inkscape  -A', file.out, file.in, sep = " ")
  system(command)
}

