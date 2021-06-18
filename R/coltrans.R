#' Transform columntypes
#'
#' Transform the columntypes of the tidy flu_data and dengue_data in my online portfolio page: relational databases
#'
#' @param x = File you want to transform the columns of
#'
#' @return Tibble with changed column types
#' @export
#'
coltrans <- function(x){
  dplyr::transmute(x,
                   country = forcats::as_factor(country),
                   year = as.character(Date),
                   searches = as.double(searches)
                   )}
