library(drake)
library(fs)
library(here)

rmd2pdf <- function(f){
  outdir <- here::here('docs','slides','lectures')
  fname <- fs::path_file(f)
  pdfname <- stringr::str_replace(fname, 'Rmd','pdf')
  pagedown::chrome_print(f, output = fs::path(outdir, pdfname))
}

slides_rmdfiles <- dir_ls('slides/lectures/', glob = '*.Rmd')
slides_outdir <- here::here('docs','slides','lectures')
slides_outrmd <- fs::path('docs',slides_rmdfiles)
slides_outpdf <- str_replace(slides_outrmd, 'Rmd','pdf')

slides_plan <- drake_plan(
  create_slides = target(
    rmarkdown::render(knitr_in(rmdf), output_dir = slides_outdir),
    transform = map(rmdf = !!slides_rmdfiles )),
  create_pdfs = target(
    rmd2pdf(knitr_in(rmdf)),
    transform = map(rmdf = !!slides_rmdfiles)),
  make_index = target(
    rmarkdown::render_site(input = knitr_in(here::here('slides','index.Rmd'))),
    trigger = trigger(depend = all(file_exists(!!slides_outrmd)))
  )
)

hw_rmdfiles <- dir_ls('assignments/HW', glob = '*.Rmd')
hw_outdir <- here::here('docs','assignments','HW')
hw_outrmd <- fs::path('docs',hw_rmdfiles)

hw_plan <- drake_plan(
  create_hw = target(
    rmarkdown::render(knitr_in(rmdf), output_dir = hw_outdir),
    transform = map(rmdf = !!hw_rmdfiles)
  ),
  make_index = target(
    rmarkdown::render_site(input = knitr_in(here::here('assignments'))),
    trigger = trigger(depend = all(file_exists(!!hw_outrmd)))
  )
)


notes_plan <- drake_plan(
  create_notes = rmarkdown::render_site(input = file_in('notes'),
                                        output_format = 'bookdown::gitbook'),
  create_notes_pdf = rmarkdown::render_site(knitr_in(here('notes')),
                                            output_format = 'bookdown::pdf_book')
)

top_plan <- drake_plan(
  create_site = target(
    rmarkdown::render_site(input = knitr_in(here::here()))
  )
)

drake_config(slides_plan, verbose = 2)

