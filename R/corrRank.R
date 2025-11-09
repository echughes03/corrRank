#' @title correlation ranking
#' @description a function that ranks a list of continuous predictor variables by their correlation with a continuous outcome.
#' @param predictors a list of predictors
#' @param outcome the outcome
#' @returns ranking
#' @examples
#' corrRank(list(BMI, Age, Blood_pressure), Obesity)
#' @export

corrRank = function(predictors, outcome){
  ranking = data.frame(matrix(ncol=3, nrow=0))
  colnames(ranking) = c("Predictor", "Correlation", "Significance")
  stopifnot("Outcome variable must be numeric" = is.numeric(outcome))

  for (i in seq_along(predictors)){
    predictor = predictors[[i]]
    stopifnot("Predictors and outcome must be equal length" = length(predictor)==length(outcome))
    stopifnot("Predictors must be numeric" = is.numeric(predictor))

    ranking = rbind(ranking, data.frame(Predictor = names(predictors)[i],
                                        Correlation = cor(predictor, outcome),
                                        Significance = ifelse(cor.test(predictor, outcome)$p.value < 0.05, "Yes", "No")))
  }
  ranking = ranking %>% arrange(desc(abs(Correlation)))
  return(ranking)
}
