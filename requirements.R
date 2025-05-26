# R Package Requirements for Econometrics Development
# Author: Eren Gündemir (@c0xad)
# Last Updated: 2025

# Core data manipulation and analysis
install.packages(c(
  'tidyverse', 'data.table', 'lubridate',
  'devtools', 'rmarkdown', 'knitr'
), dependencies = TRUE)

# Time series and econometric modeling
install.packages(c(
  'forecast', 'tseries', 'vars', 'urca',
  'fGarch', 'rugarch', 'rmgarch',
  'plm', 'fixest', 'broom',
  'AER', 'sandwich', 'lmtest',
  'car', 'MASS'
), dependencies = TRUE)

# Financial econometrics
install.packages(c(
  'quantmod', 'PerformanceAnalytics',
  'RQuantLib', 'fBasics', 'fPortfolio'
), dependencies = TRUE)

# Machine learning and advanced analytics
install.packages(c(
  'caret', 'randomForest', 'glmnet',
  'xgboost', 'ranger'
), dependencies = TRUE)

# Visualization and reporting
install.packages(c(
  'ggplot2', 'plotly', 'DT',
  'stargazer', 'modelsummary', 'gt',
  'shiny', 'shinydashboard'
), dependencies = TRUE)

# High-performance computing
install.packages(c(
  'RcppArmadillo', 'RcppEigen',
  'parallel', 'doParallel'
), dependencies = TRUE)

# GitHub packages (development versions)
if (!require(devtools)) install.packages('devtools')
devtools::install_github('rstudio/gt')
devtools::install_github('vincentarelbundock/modelsummary')

cat("✅ R packages installed successfully!\n") 