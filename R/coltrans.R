#' Transform column types
#'
#' Transform the column types of the tidy flu_data and dengue_data in my online portfolio page, chapter: relational databases
#'
#' @param file The file you want to transform the columns of
#'
#' @return Tibble with changed column types
#' @export
#'
coltrans <- function(file){
  dplyr::transmute(file,
                   country = forcats::as_factor(country),
                   year = as.character(Date),
                   searches = as.double(searches)
                   )}
