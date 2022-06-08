#' Calculate the mean of Rawdata in the portfolio
#'
#' calculate the mean value of the Rawdata column in my online portfolio page, chapter: C elegans Plate Experiment
#'
#' @param data The dataset to calculate the mean of
#'
#' @return Updated table with mean values
#' @export
#'
mean_data <- function(data){
  data %>%
  dplyr::select(expType, RawData, compName, compConcentration) %>%
    dplyr::group_by(expType) %>%
    dplyr::filter(expType == 'controlNegative') %>%
    dplyr::summarise(mean_RawData = base::mean(RawData, na.rm = TRUE))
}
