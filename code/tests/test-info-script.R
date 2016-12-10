library(testthat)
source("../functions/regression-functions.R")

context("Test for regression statistics") 

test_that("residual sum of squares", {
  advertising <- read.csv("../../data/Advertising.csv", header = TRUE)
  model <- lm(sales ~ ., data = advertising)
  
  expect_equal(round(residual_sum_squares(model), 4), round(sum(model$residuals ^ 2), 4))
  expect_type(residual_sum_squares(model), 'double')
})



test_that("F statistics", {
  advertising <- read.csv("../../data/Advertising.csv", header = TRUE)
  model <- lm(sales ~ ., data = advertising)
  
  f_stat <- summary(model)$fstatistic[1]
  names(f_stat) <- NULL
  
  expect_equal(round(f_statistic(model), 4), round(f_stat, 4))
  expect_length(f_statistic(model), 1)
})

test_that("r-squared", {
  advertising <- read.csv("../../data/Advertising.csv", header = TRUE)
  model <- lm(sales ~ ., data = advertising)
  
  expect_length(r_squared(model), 1)
  
  r.squared <- summary(model)$r.squared
  expect_equal(r_squared(model), r.squared)
  
  expect_type(r_squared(model), 'double')
})


test_that("residual standard error", {
  advertising <- read.csv("../../data/Advertising.csv", header = TRUE)
  model <- lm(sales ~ ., data = advertising)
  
  
  RSE <- summary(model)$sigma
  expect_equal(residual_std_error(model), RSE)
  expect_length(residual_std_error(model), 1)
  expect_type(residual_std_error(model), 'double')
})