#' Run an on-board Shiny app to browse the metadata and data availability of Quality of government data
#' 
#' @export
#' @examples # run_app()
#' @author Markus Kainu <markus.kainu(at)kapsi.fi> 

run_app <- function() {
  shiny::runApp(paste0(system.file(package="rqog"),"/extras/rqog_app/"))
}
