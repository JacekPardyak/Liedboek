
# run in command lind
cmd <- c('cd \Documents\Liederen\bookdown-demo-master')
cmd <- c('Rscript -e "bookdown::render_book(\"index.Rmd\", \"bookdown::gitbook\")"')
cmd <- c('Rscript -e "bookdown::render_book(\"index.Rmd\", \"bookdown::pdf_book\")"')
cmd <- c('Rscript -e "bookdown::render_book(\"index.Rmd\", \"bookdown::epub_book\")"')

