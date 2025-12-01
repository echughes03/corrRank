# corrrank
This r package contains two functions that assist in exploratory analysis of linear associations. The function _corrrank_ ranks a list of predictor variables based on the absolute value of their correlation with a given outcome variable. The other function _cplot_ creates a scatterplot of a given predictor-outcome association. The functions are designed for use on numerical variables. 

## Rationale
When working with a dataset containing many continuous variables, it can take time and effort to discern which variables are associated and how. The goal of this package is to speed up this process and allow for faster identification of the strongest associations in a dataset. 

## corrrank
The _corrrank_ function computes pairs of linear Pearson correlations between a list of named predictors and a given outcome. The function outputs a ranked list of correlations from strongest (closest in absolute value to 1) to weakest (closest in absolute value to 0).

## cplot
The _cplot_ function creates a clean, simple scatterplot of a given predictor-outcome relationship. The correlation value and fitted simple linear regression line can easily be added to the plot as well.

## R installation
```R
install.packages("devtools") 
library(devtools)
devtools::install_github("echughes03/corrrank")
library(corrrank)
```
