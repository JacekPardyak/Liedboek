invisible(Sys.setlocale("LC_ALL","Polish"))
text <- readLines("./_book/index.html")
text

x <- text[14]

text <- sapply(text, function(x) gsub(pattern = "/./", replacement = "/", x = x))
writeLines(text, "./_book/index.html")

gsub(pattern = "/./", replacement = "/", x = x)
# 14, 22
# /./