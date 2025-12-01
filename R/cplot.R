#' @title correlation scatterplot
#' @description a function that prints bivariate plots of outcome against exposure (from a list of predictors in the order specified). Bivariate plots are stored in a list that allows for individual plot extraction. The plots are output with a line of best fit and correlation coefficient included as default arguments. Both the line of best fit and correlation coefficient can be excluded when running the cplot() function. Scatterplots can be relabeled and modified according to ggplot2 plotting conventions.
#' @param outcome numeric outcome variable, vector
#' @param predictors list of numeric predictor(s), vectors
#' @returns list of ggplot2 output(s). List can be indexed to output specific plot(s)
#' @examples
#' exposures <- list(Work = cities$avg_hours_worked_annual, Pollution = cities$pollution_index, Sunshine = cities$sunshine_hours)
#' plot_list <- cplot(exposures, cities$happiness_level)
#' plot_list$`Exposure 1`
#' plot_list$`Exposure 2`
#' plot_list$`Exposure 3`
#'
#' # relabeling and excluding line of best fit
#' plot_list <- cplot(exposures, cities$happiness_level, line = F)
#' plot_list$`Exposure 3` + labs(x = "Annual Hours of Sunshine", y = "Happiness Level", title = "Correlation Between Annual Hours of Sunshine and Happiness Level")
#' @import dplyr
#' @import ggplot2
#' @import glue
#' @export

cplot <- function(predictors, outcome, r = T, line = T) {

  plots <- list()

  for (i in seq_along(predictors)) {
    predictor <- predictors[[i]]
    correlation <- cor(x = predictor, y = outcome, use = "complete.obs")

    df <- data.frame(exposure = predictor, response = outcome)

    if (r == F & line == F) {
      corr_plot <- ggplot2::ggplot(data = df, aes(x = exposure, y = response)) +
        geom_point() +
        labs(title = glue("Correlation Between {deparse(substitute(outcome))} and Exposure {i}"),
             x = glue("Exposure {i}"),
             y = glue("{deparse(substitute(outcome))}")) +
        theme_minimal()

      plots[[glue("Exposure {i}")]] <- corr_plot
    }
    else if (r == T & line == F) {
      corr_plot <- ggplot2::ggplot(data = df, aes(x = exposure, y = response)) +
        geom_point() +
        labs(subtitle = glue("r = {round(correlation,3)}")) +
        labs(title = glue("Correlation Between {deparse(substitute(outcome))} and Exposure {i}"),
             x = glue("Exposure {i}"),
             y = glue("{deparse(substitute(outcome))}")) +
        theme_minimal()

      plots[[glue("Exposure {i}")]] <- corr_plot
    }
    else if (r == F & line == T) {
      corr_plot <- ggplot2::ggplot(data = df, aes(x = exposure, y = response)) +
        geom_point() +
        geom_smooth(method = "lm", se = F) +
        labs(title = glue("Correlation Between {deparse(substitute(outcome))} and Exposure {i}"),
             x = glue("Exposure {i}"),
             y = glue("{deparse(substitute(outcome))}")) +
        theme_minimal()

      plots[[glue("Exposure {i}")]] <- corr_plot
    }
    else {
      corr_plot <- ggplot2::ggplot(data = df, aes(x = exposure, y = response)) +
        geom_point() +
        geom_smooth(method = "lm", se = F) +
        labs(subtitle = glue("r = {round(correlation,3)}")) +
        labs(title = glue("Correlation Between {deparse(substitute(outcome))} and Exposure {i}"),
             x = glue("Exposure {i}"),
             y = glue("{deparse(substitute(outcome))}")) +
        theme_minimal()

      plots[[glue("Exposure {i}")]] <- corr_plot
    }

  }
  return(plots)
}



