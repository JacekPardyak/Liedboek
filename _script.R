# 1. build book normally to have images and proper tex file
# unlink("./_book_post/", recursive = TRUE)
# file.remove("./_book_post/")
# 2. generate *md file
bookdown::render_book('index.Rmd', output_format = "all", clean = FALSE, output_dir = "./_book_post/")
file.copy(from = "./liedboek.utf8.md", to = "./_book_post/liedboek.utf8.md")

#### -------------------------
#### EPUB
# make changes in copied *md file
# 1. BLOF -> BLØF
# make epub
system('"C:/Users/A599131/AppData/Local/Pandoc/pandoc" +RTS -K512m -RTS "C:/Users/A599131/Documents/Liedboek/_book_post/liedboek.utf8.md" --to epub3 --from markdown+autolink_bare_uris+tex_math_single_backslash --output "C:/Users/A599131/Documents/Liedboek/_book_post/liedboek.epub" --number-sections --filter "C:/Users/A599131/AppData/Local/Pandoc/pandoc-citeproc.exe"')

#### -------------------------
#### PDF
# system('"C:/Users/A599131/AppData/Local/Pandoc/pandoc" +RTS -K512m -RTS "C:/Users/A599131/Documents/Liedboek/_book_post/liedboek.utf8.md" --to latex --from markdown+autolink_bare_uris+tex_math_single_backslash --output "C:/Users/A599131/Documents/Liedboek/_book_post/liedboek.tex" --self-contained --table-of-contents --toc-depth 2 --number-sections --highlight-style tango --pdf-engine xelatex --natbib --include-in-header preamble.tex --variable graphics --lua-filter "C:/Users/A599131/Documents/R/win-library/3.6/rmarkdown/rmd/lua/pagebreak.lua" --lua-filter "C:/Users/A599131/Documents/R/win-library/3.6/rmarkdown/rmd/lua/latex-div.lua" --wrap preserve --variable tables=yes --standalone -Mhas-frontmatter=false')
file.copy(from = "./songs.bib", to = "./_book_post/songs.bib")
# make changes in tex
# ...
# 1. 'songs.bib' to 'songs'
# 2. './images' to '../images'
# 3. 'BLOF' to 'BLØF'

#file.copy(from = "./preamble.tex", to = "./_book_post/preamble.tex")
#file.copy(from = "./songs.bib", to = "./_book_post/songs.bib")
# make pdf from latex
system('pdflatex --output-directory "C:/Users/A599131/Documents/Liedboek/_book_post/" "C:/Users/A599131/Documents/Liedboek/_book_post/liedboek" ')
system('bibtex  "C:/Users/A599131/Documents/Liedboek/_book_post/liedboek" ')
system('pdflatex --output-directory "C:/Users/A599131/Documents/Liedboek/_book_post/" "C:/Users/A599131/Documents/Liedboek/_book_post/liedboek" ')
system('pdflatex --output-directory "C:/Users/A599131/Documents/Liedboek/_book_post/" "C:/Users/A599131/Documents/Liedboek/_book_post/liedboek" ')

# add cover page
#system('pdflatex --output-directory "C:/Users/A599131/Documents/Liedboek/_book_post/" "C:/Users/A599131/Documents/Liedboek/_cover-page" ')


#### -------------------------
#### HTML
# w index.html
# 1. './images/' to '/images/'

        