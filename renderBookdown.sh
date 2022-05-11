#!/usr/bin/env Rscript
Rscript -e "bookdown::render_book()" && rm -r ~/Documents/Neotoma/neotomadb.github.io/manual/* && mv ./_book/* ~/Documents/Neotoma/neotomadb.github.io/manual
