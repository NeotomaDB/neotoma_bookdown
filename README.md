# Neotoma Bookdown Manual

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![NSF-XXXXXXX](https://img.shields.io/badge/NSF-1948926-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1948926)
[![DOI](https://zenodo.org/badge/487067181.svg)](https://zenodo.org/badge/latestdoi/487067181)

Development of the [Neotoma Paleoecology Database manual](https://neotoma-manual.readthedocs.io/en/latest/) in the form of a [Bookdown](https://bookdown.org/yihui/bookdown/) document. This is a revision of the [ReStructured Markdown Neotoma manual](https://github.com/SimonGoring/neotomadb-manual), and as such has its own GitHub repository.

## Contributors

This project is an open project, and contributions are welcome from any individual.  All contributors to this project are bound by a [code of conduct](CODE_OF_CONDUCT.md).  Please review and follow this code of conduct as part of your contribution.

* [Simon Goring](http://goring.org) [![orcid](https://img.shields.io/badge/orcid-0000--0002--2700--4605-brightgreen.svg)](https://orcid.org/0000-0002-2700-4605)

### Tips for Contributing

Issues and bug reports are always welcome.  Code clean-up, and feature additions can be done either through pull requests to project forks or branches.

All products of the Throughput Annotation Project are licensed under an [MIT License](LICENSE) unless otherwise noted.

## How to use this repository

This repository is managed as a [Bookdown project](https://bookdown.org/) using R and SQL scripts to demonstrate use of the Neotoma Database.  The connection to the database is managed through a file that is ignored in `.gitignore`.  This file needs to be added to the repository before the Bookdown project is compiled.

### `connect_remote.json`

A file in JSON format that is used as the connection string for the database.  If you use a [Neotoma snapshot](https://www.neotomadb.org/snapshots) to work with the database locally, your `connect_remote.json` file will look like this:

```json
{
    "host": "localhost",
    "port": 5432,
    "database": "neotoma",
    "user": "postgres",
    "password": "postgres",
}
```

If you intend to continue tracking your version of this repository and want to push to a public code repository then ensure that the file `connect_remote.json` is included in your `.gitignore` file.

All references and images should be included in the `assets` folder, split into text and image folders.  Images should be clearly labelled.

### Workflow Overview

The project uses R.  All required packages are included in the file `requirements.txt`.  In package load (in the file `index.Rmd`) the requirements file is loaded into the project and the [`pacman` package]() is used to load all the required packages using `p_load()`. Implied in all of this is that the package `bookdown` is used in this project.

This repository comes with a `bash` script that can be used to compile the project on Linux and Mac computers by calling `bash renderBookdown.sh`. This script will render the Bookdown document to an HTML file that can be directly navigated.

### System Requirements

This project was developed using R (v4.2+) using both RStudio and Visual Studio Code. To properly render the document requires the use of [`pandoc` (v2.17+)](https://pandoc.org/).

### Data Requirements

This Bookdown version of the manual directly calls data from the Neotoma database, either using the `neotoma2` R package, or through calls using SQL.

### Key Outputs

This project generates an HTML document that can be read as a manual.

## Metrics

This project is to be evaluated using the following metrics:

* Complete rendering of the manual (generally from the past version)
* All SQL queries re-written to reflect Postgres standard SQL
* Addition of R code to mimic the SQL calls
