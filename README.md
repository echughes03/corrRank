# corrrank
This r package contains two functions that assist in exploratory analysis of linear associations. The function _corrrank_ ranks a list of predictor variables based on the absolute value of their correlation with a given outcome variable. The other function _cplot_ creates a scatterplot of a given predictor-outcome association. The functions are designed for use on numerical variables only.

## Rationale
When working with a dataset containing many continuous variables, it can take time and effort to discern which variables are associated and how. The goal of this package is to speed up this process and allow for faster identification of the strongest associations in a dataset. 

## corrrank
The _corrrank_ function computes pairs of linear Pearson correlations between a list of named predictors and a given outcome. The function outputs a ranked list of correlations from strongest (closest in absolute value to 1) to weakest (closest in absolute value to 0). Information on the strength of the association (ie. weak/moderate/strong and positive/negative) is also included.

### Example
```R
corrRank(list(Work = cities$avg_hours_worked_annual, 
              Pollution = cities$pollution_index, 
              Sunshine = cities$sunshine_hours), 
              cities$happiness_level)
```
Given a dataframe called _cities_, the code above will rank the predictors _Work_, _Pollution_ and _Sunshine_ by their correlation with the outcome happiness level. Predictors must be named and enclosed in a list, while the outcome can be directly indexed from the dataframe.

## cplot
The _cplot_ function creates a clean, simple scatterplot of a given predictor-outcome relationship. The correlation value and fitted simple linear regression line can easily be added to the plot as well.

### Example
```R

```

## R installation
```R
install.packages("devtools") 
library(devtools)
devtools::install_github("echughes03/corrrank")
library(corrrank)
```
