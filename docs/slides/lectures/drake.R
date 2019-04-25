library(drake)
library(fs)
suppressPackageStartupMessages(library(tidyverse))

files <- dir_ls(path=here::here('slides/lectures'), glob='*.Rmd', type='file')
in_pdf <- files %>% map_chr(~str_replace(.,'Rmd','pdf'))
out_pdf <- files %>% map_chr(~str_replace(., 'slides','docs/slides')) %>%
  map_chr(~str_replace(.,'Rmd','pdf'))
out_html <- files %>% map_chr(~str_replace(., 'slides','docs/slides')) %>%
    map_chr(~str_replace(., 'Rmd','html'))

mv_pdf <- function(f){
  file_move(f, str_replace(f, 'slides','docs/slides'))
}

plan <- drake_plan(
  render = target(
    rmarkdown::render(
      knitr_in(infile), output_dir=here::here('docs/slides/lectures')),
    transform = map(infile = !!files))
)
plan_pdf <- drake_plan(
 render_pdf = target(
    pagedown::chrome_print(infile),
    transform = map(infile = !!files)
  ),
 move_pdf = target(
   mv_pdf(infile),
   transform = map(infile = !!in_pdf)
 )
)

# config <- drake_config(plan)
# vis_drake_graph(config)
