#!/usr/bin/env Rscript
Rscript -e "bookdown::render_book()" && rm -r ~/Documents/Neotoma/neotomadb.github.io/manual/* && cp -r ./_book/* ~/Documents/Neotoma/neotomadb.github.io/manual
