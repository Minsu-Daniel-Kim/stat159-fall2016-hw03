
advertising = read.csv("../../data/Advertising.csv")
advertising.model = lm(Sales ~ . -V1, data = advertising)
advertising.model.summary = summary(advertising.model)


# Residual Sum of Squares. Write a function residual_sum_squares() to calculate the $RSS$ (residual sum of squares). 
# This function should take the "lm" object as input, and the output is the $RSS$. See the formula of eq. 3.16 (page 69).
residual_sum_squares <- function(lm) {
  
  return(sum(lm$residuals ** 2))
  
}
# Total Sum of Squares. Write a function total_sum_squares() to calculate the $TSS$ (total sum of squares). 
# This function takes the "lm" object as input, and it returns the $TSS$. See description right below the formula of eq 3.17 (page 70).
total_sum_squares <- function(lm) {
  # TSS = 􏰂(yi − y ̄)2
  
  return(sum( (lm$fitted.values - mean(lm$fitted.values)) ^ 2))
  
}
# R-squared. Write a function r_squared() to calculate the $R^2$ (coefficient of determination) 
# This function takes the "lm" object as input, and it returns the $R^2$. See formula of eq 3.17 (page 70).
r_squared <- function(lm) {
  
  lm.summary = summary(lm)
  return(lm.summary$r.squared)
}

# F-statistic. Write a function f_statistic() to calculate $F$-statistic. 
# This function takes the "lm" object as input, and it returns the $F$-statistic. See formula of eq 3.23 (page 75).
f_statistic <- function(lm) {
  
  lm.summary = summary(lm)
  return(lm.summary$fstatistic[1])
  
}

# Residual Standard Error. Write a function residual_std_error() to calculate the $RSE$ (residual standard error). 
# This function takes the "lm" object as input, and it returns the $RSE$. See formula of eq 3.25 (page 80).

residual_std_error <- function(lm) {
  
  lm.summary = summary(lm)
  
  return( lm.summary$sigma )
}

get_table_three_four <- function(lm){
  
  advertising.model.summary = summary(lm)
  coeff = advertising.model.summary$coefficients
  coeff = data.frame(coeff)
  colnames(coeff) <- c("Coefficient", "Std. error", "t-statistic", "p-value")
  coeff$`p-value` = ifelse((coeff$`p-value` < 0.0001), "< 0.0001", p-value)
}

get_table_three_five <- function(lm) {
  
  df = select(advertising, TV, Radio, Newspaper, Sales)
  colnames(df) = c("TV", "radio", "newspaper", "sales")
  matrix_corr = round(cor(df), 4)
  lower_tri = lower.tri(matrix_corr)
  matrix_corr[lower_tri] <- NA
  return(matrix_corr)
}

get_table_three_six <- function(lm) {
  
  Quantity = c("Residual standard error", "R^2", "F-statistic")
  Value = c(residual_std_error(lm), r_squared(lm), f_statistic(lm))
  return(data.frame(Quantity, Value))
  
}


