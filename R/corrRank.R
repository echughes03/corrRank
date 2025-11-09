#' @title correlation ranking
#' @description a function that ranks a list of continuous predictor variables by their correlation with a continuous outcome.
#' @param predictors a list of predictors
#' @param outcome the outcome
#' @returns ranking
#' @examples
#' corrRank(list("BMI", "Blood pressure", "Age"), Cholesterol)
#' @export

corrRank = function(predictors, outcome){
  # deal with missing values
  # message if different dimensions
  ranking = data.frame("Predictor", "Correlation")
  for (predictor in predictors){
    rbind(ranking, data.frame(Predictor = predictor, Correlation = cor(predictor, outcome)))
  }
  ranking = ranking %>% arrange(abs(Correlation))
  return(ranking)
}
