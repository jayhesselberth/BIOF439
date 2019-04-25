--- 
title: |
  | BIOF 439: Data Visualization using R
  | Course Notes
author: "Abhijit Dasgupta, PhD"
date: "Last updated: April 25, 2019"
knit: bookdown::render_book
site: bookdown::bookdown_site
fontsize: "12pt"
mainfont: "Charter"
monofont: "Source Code Pro"
geometry: "margin=0.75in, letterpaper"
github-repo: araastat/BIOF439
description: "These are course notes for BIOF 439, Data Visualization using R"
url: http://www.araastat.com/BIOF439
twitterhandle: webbedfeet

---



# Welcome {-}

This course is an introduction to the statistical programming language 
[R](http://www.r-project.org) and various applications. We will cover the entire data analytics pipeline from data ingestion to data wrangling, summarizing, modeling, visualizing and reporting, all using tools found within the R ecosystem. 

The version of these notes you are reading now was built on 
2019-04-25. To raise an issue about the note's content (e.g., code not running) or to make a feature request, check out the 
[issue tracker](https://github.com/araastat/FSI_Book/issues).

## Reproducibility {-}

These notes are written with [`bookdown`](https://bookdown.org), a R package for writing books using [`rmarkdown`](https://rmarkdown.rstudio.com).
All code in these notes were developed on R version 3.5.3 (2019-03-11), using
the same packages pre-installed in your virtual machines. When you're on your
own, you will need to install a recent version of R, and also install the
corresponding packages, on your computer, for all the code to work. A listing of
all the packages used in this course will be available as an appendix.

To build these notes locally, clone or [download](https://github.com/araastat/FSI_Book/archive/master.zip) the 
[Github repo](https://github.com/araastat/FSI_Book) hosting these notes, unzip it if necessary, and double-click on `FSI_Book.Rproj`. Assuming you have RStudio installed, this will open this project (more on _RStudio Projects_ later). You can then go to the console and enter the following code:```{r, eval = F}
bookdown::render_book("index.Rmd") # to build these notes
browseURL("_book/index.html") # to view it
```
