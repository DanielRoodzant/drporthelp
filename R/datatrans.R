#' Transform data
#'
#' Transform data in flu_data and dengue_data to make them joinable
#'
#' @param x = file you want to transform the data of
#'
#' @return Tibble with altered data
#' @export
#'
datatrans <- function(x){
    dplyr::mutate(x,
                  year = stringr::str_sub(year, end = 4)) %>%
    dplyr::group_by(country, year) %>%
    dplyr::summarize(searches = round(sum(searches, na.rm = FALSE), 2))
              }
