#' Plot data using ggplot
#'
#' Plot data in a scatterplot using ggplot for 2 plots in my online portfolio page, chapter: C elegans Plate Experiment
#'
#' @param data The data to be plotted
#'
#' @return Scatterplot graph
#' @export
#'
plot_data <- function(data){
  ggplot2::ggplot(data, aes(x = compConcentration, y = RawData)) +
  geom_point(aes(colour = compName, shape = expType)) +
  labs(title = "Compound RawData per compound concentration",
       caption = "Data supplied by J. Louter (INT/ILC)") +
  xlab("Concentration (nM)") +
  ylab("Number of offspring (n)")
}
