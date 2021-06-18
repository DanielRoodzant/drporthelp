coltrans <- function(x){
  x %>%
  transmute(country = as_factor(country),
            year = as.character(Date),
            searches = as.double(searches)
  )}
