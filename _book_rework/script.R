book_old <- "./_book/"
book_new <- "./_book_rework/"

file.copy(book_old, book_new, recursive=TRUE)

tmp <- readLines("./_book_rework/_book/liedboek.tex") #, encoding = "")

tmp <- sapply(tmp, function(x) gsub("BLOF", "BLØF", x))

writeLines(tmp, "./_book_rework/_book/liedboek_ready.tex", useBytes = TRUE)


bookdown::render_book('index.Rmd', clean = FALSE).

bookdown::render_book('index.Rmd', 'bookdown::gitbook', clean = FALSE)

# to html - bit fuckted up
system('"C:/Users/A599131/AppData/Local/Pandoc/pandoc" +RTS -K512m -RTS liedboek.utf8.md --to html4 
        --from markdown+autolink_bare_uris+tex_math_single_backslash+smart --output liedboek.html
        --email-obfuscation none --wrap preserve --standalone --section-divs --table-of-contents --toc-depth 3
        --template "C:/Users/A599131/Documents/R/win-library/3.6/bookdown/templates/gitbook.html"
        --highlight-style pygments --number-sections --css style.css 
        --include-in-header "C:/Users/A599131/AppData/Local/Temp/RtmpMt4p75/rmarkdown-str58f85d12a5a.html"
        --mathjax --lua-filter "C:/Users/A599131/Documents/R/win-library/3.6/rmarkdown/rmd/lua/pagebreak.lua"
        --lua-filter "C:/Users/A599131/Documents/R/win-library/3.6/rmarkdown/rmd/lua/latex-div.lua" 
        --filter "C:/Users/A599131/AppData/Local/Pandoc/pandoc-citeproc.exe"') 

# to epub -  works
system('"C:/Users/A599131/AppData/Local/Pandoc/pandoc" +RTS -K512m -RTS "C:/Users/A599131/Documents/Liedboek/liedboek.utf8.md" --to epub3 --from markdown+autolink_bare_uris+tex_math_single_backslash --output "C:/Users/A599131/Documents/Liedboek/liedboek.epub" --number-sections --filter "C:/Users/A599131/AppData/Local/Pandoc/pandoc-citeproc.exe"')

bookdown::render_book('index.Rmd', 'bookdown::pdf_book', clean = FALSE)
# to latex
system('"C:/Users/A599131/AppData/Local/Pandoc/pandoc" +RTS -K512m -RTS "C:/Users/A599131/Documents/Liedboek/liedboek.utf8.md" --to latex --from markdown+autolink_bare_uris+tex_math_single_backslash --output "C:/Users/A599131/Documents/Liedboek/liedboek.tex" --self-contained --table-of-contents --toc-depth 2 --number-sections --highlight-style tango --pdf-engine xelatex --natbib --include-in-header preamble.tex --variable graphics --lua-filter "C:/Users/A599131/Documents/R/win-library/3.6/rmarkdown/rmd/lua/pagebreak.lua" --lua-filter "C:/Users/A599131/Documents/R/win-library/3.6/rmarkdown/rmd/lua/latex-div.lua" --wrap preserve --variable tables=yes --standalone -Mhas-frontmatter=false')

# disqus:  .qDTEtFn.33QkCS

# --------------
system('pdflatex --output-directory "C:/Users/A599131/Documents/Liedboek/_book_rework/_book/"  "C:/Users/A599131/Documents/Liedboek/_book_rework/_book/liedboek" ')
system('bibtex  "C:/Users/A599131/Documents/Liedboek/_book_rework/_book/liedboek" ')

--include-directory="C:/Users/A599131/Documents/Liedboek/_book_rework/_book/"

system('pdflatex --include-directory="C:/Users/A599131/Documents/Liedboek/_book/" liedboek')

system('pdflatex liedboek')

system('bibtex --include-directory="C:/Users/A599131/Documents/Liedboek/_book/" "C:/Users/A599131/Documents/Liedboek/_book/liedboek" ')


# texworks działą, ja się zmieni songs.bib na songs        
        
        