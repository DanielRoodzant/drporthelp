
<!-- README.md is generated from README.Rmd. Please edit that file -->

# drporthelp

<!-- badges: start -->
<!-- badges: end -->

The goal of drporthelp is to display my skill in building a package and
creating functions. It is used in my personal online portfolio to take
on some of the duplicate code.

The portfolio can be found
[here](https://danielroodzant.github.io/dsfb2_workflows_portfolio/index.html).

The portfolio GitHub can be found
[here](https://github.com/DanielRoodzant/dsfb2_workflows_portfolio).

## Installation

You can install the released version of drporthelp from
[GitHub](https://github.com/DanielRoodzantHU/drporthelp)

``` r
install.packages("https://github.com/DanielRoodzantHU/drporthelp")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("DanielRoodzantHU/drporthelp")
```

## Usage

The functions in this package were designed to assist in specific parts
of the portfolio.

The `coltrans()` function transforms column types in the [Relational
Databases](https://danielroodzant.github.io/dsfb2_workflows_portfolio/relational-databases.html)
chapter of the portfolio. In the chapter it is used as follows:

``` r
# Load the datasets into R datframes
flu_data <- read.csv('data/data_raw/005_relational_databases/flu_data.csv', skip = 11) %>% as_tibble()
dengue_data <- read.csv("data/data_raw/005_relational_databases/dengue_data.csv", skip = 11) %>% as_tibble()

# Tidy the flu_data and dengue_data datasets
flu_data <- flu_data %>% 
  tidyr::pivot_longer(cols = Argentina:Uruguay,
                      names_to = "country", 
                      values_to = "searches"
                      )
dengue_data <- dengue_data %>% 
  tidyr::pivot_longer(cols = Argentina:Venezuela,
                      names_to = "country", 
                      values_to = "searches"
                      )

# Match the column types of the datasets
flu_data <- coltrans(flu_data)
dengue_data <- coltrans(dengue_data)
```

The `datatrans()` function transforms the data in two datasets to make
them joinable. It is used in the [Relational
Databases](https://danielroodzant.github.io/dsfb2_workflows_portfolio/relational-databases.html)
chapter of the portfolio. In the chapter it is used as follows:

``` r
# Make the data tables joinable
flu_data <- datatrans(flu_data)
dengue_data <- datatrans(dengue_data)

# Join the data tables
flu_dengue_data <- full_join(flu_data, 
                             dengue_data, 
                             by = c("country", "year"), 
                             suffix = c("_flu", "_dengue")
                             )
gap_flu_dengue_data <- inner_join(flu_dengue_data, 
                                 gapminder, 
                                 by = c("country", "year")
                                 )
```

The `plot_data()` function plots specific data from the portfolio into a
scatterplot in the [C. elegans Plate
Experiment](https://danielroodzant.github.io/dsfb2_workflows_portfolio/c.-elegans-plate-experiment.html)
chapter of the portfolio. In the chapter it is used as follows:

``` r
# Show example of the wrong graph from unedited .xlsx format by retrieving data
wrong_scatter_FLOW.062 <- read_excel(here::here('inst/c_elegans_plate_exp/CE.LIQ.FLOW.062_Tidydata.xlsx'))

# Plotting data using ggplot through a function in drporthelp
wrong_scatter_FLOW.062 %>% drporthelp::plot_data()
```

The `mean_data()` function calculates the mean of the Rawdata in the
dataset used in the chapter [C. elegans Plate
Experiment](https://danielroodzant.github.io/dsfb2_workflows_portfolio/c.-elegans-plate-experiment.html).
In the chapter it is used as follows:

``` r
# Calculate the mean of the RawData
mean_data_FLOW.062 <- scatter_FLOW.062 %>% mean_data()
```

For the full results on the use of the functions, please see the
corresponding chapters or the vignettes.
