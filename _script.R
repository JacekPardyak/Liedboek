library(bib2df)
# Read from .bib file:
path <- system.file("extdata", "bib2df_testfile_3.bib", package = "bib2df")
bib <- bib2df(path)

# Write to .bib file:
bibFile <- tempfile()
df2bib(bib, file = "songggs.bib")

# Use `append = TRUE` to add lines to an existing .bib file:
# df2bib(bib, bibFile, append = TRUE)
