
# Residual Sum of Squares. It calculates the residual sum of squares
# It takes "lm" object as input, and the output is the residual sum of squares.
residual_sum_squares <- function(lm) {
  
  
  
  RSS <- sum((lm$model$sales - lm$fitted.values) ** 2)
  
  return(RSS)
  
}
# Total Sum of Squares. It calculates the total sum of squares.
# It takes the "lm" object as input, and it returns the TSS.
total_sum_squares <- function(lm) {
  
  # RSS <- residual_sum_squares(lm)
  # TSS <- (RSS / (1 - summary(lm)$r.squared))
  
  mean_value <- mean(lm$model$sales)
  TSS <- sum((lm$model$sales - mean_value) ** 2)
  
  return(TSS)
  
}
# R-squared. It calculates the coefficient of determination
# It takes the "lm" object as input, and it returns the R^2
r_squared <- function(lm) {
  
  
  RSS <- residual_sum_squares(lm)
  TSS <- total_sum_squares(lm)
  return(1 - (RSS / TSS))
}

# F-statistic. It calculates $F$-statistic. 
# It takes the "lm" object as input, and it returns the F-statistic.
f_statistic <- function(lm) {
  
  RSS <- residual_sum_squares(lm)
  TSS <- total_sum_squares(lm)

  n <- nrow(lm$model)
  p <- ncol(lm$model) - 1
  
  f_statistic <- ((TSS - RSS) / p) / (RSS / (n - p - 1))
  return(f_statistic)
  
}


# Residual Standard Error. It calculates the residual standard error. 
# It takes the "lm" object as input, and it returns the RSE.

residual_std_error <- function(lm) {
  
  RSS <- residual_sum_squares(lm)
  
  n <- nrow(lm$model)
  p <- ncol(lm$model) - 1
  
  RSE <- sqrt( (1 / (n - p - 1)) * RSS )
  return(RSE)
}

# It generates a table 3.4 in Introduction to statistical learning
# It takes the "lm" object as input, and it returns coefficients of the model

get_table_three_four <- function(lm){
  
  advertising.model.summary = summary(lm)
  coeff = advertising.model.summary$coefficients
  coeff = data.frame(coeff)
  colnames(coeff) <- c("Coefficient", "Std. error", "t-statistic", "p-value")
  coeff$`p-value` = ifelse((coeff$`p-value` < 0.0001), "< 0.0001", p-value)
  return(coeff)
}

# It generates a table 3.5 in Introduction to statistical learning
# It takes the "lm" object as input, and it returns matrix of the correlation

get_table_three_five <- function(lm) {
  
  df = select(advertising, TV, radio, newspaper, sales)
  # colnames(df) = c("TV", "radio", "newspaper", "sales")
  matrix_corr = round(cor(df), 4)
  lower_tri = lower.tri(matrix_corr)
  matrix_corr[lower_tri] <- NA
  return(matrix_corr)
}

# It generates a table 3.6 in Introduction to statistical learning
# It takes the "lm" object as input, and it returns r-squared
get_table_three_six <- function(lm) {
  
  Quantity = c("Residual standard error", "R^2", "F-statistic")
  Value = c(residual_std_error(lm), r_squared(lm), f_statistic(lm))
  return(data.frame(Quantity, Value))
  
}


