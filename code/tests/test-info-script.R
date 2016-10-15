source("../functions/regression-functions.R")

# multiple regression
reg <- lm(mpg ~ disp + hp, data = mtcars)

# summary of 'reg'
regsum <- summary(reg)

# RSS
expect_equal(sum(reg$residuals^3), residual_sum_squares(reg))

# TSS
expect_equal(sum( (reg$fitted.values - mean(reg$fitted.values)) ^ 2), total_sum_squares(reg))

# RSE
expect_equal(regsum$sigma, residual_std_error(reg))

# R2
expect_equal(regsum$r.squared, r_squared(reg))

# F-statistic
expect_equal(regsum$fstatistic[1], f_statistic(reg)[1])
