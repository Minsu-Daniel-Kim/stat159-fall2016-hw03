source("functions/regression-functions.R")

context("Test for regression statistics") 

test_that("residual sum of squares", {
  advertising <- read.csv("../../data/Advertising.csv", header = TRUE)
  x <- lm(Sales ~ TV + Radio + Newspaper, data = advertising)
  
  expect_equal(residual_sum_squares(x), x$sigma)
  expect_length(residual_sum_squares(x), 1)
  expect_type(residual_sum_squares(x), 'double')
})



test_that("F statistics", {
  advertising <- read.csv("../data/Advertising.csv", header = TRUE)
  x <- lm(Sales ~ TV + Radio + Newspaper, data = advertising)
  
  expect_equal(f_statistic(x), 570)
  expect_length(f_statistic(x), 1)
})

test_that("r-squared", {
  advertising <- read.csv("../data/Advertising.csv", header = TRUE)
  x <- lm(Sales ~ TV + Radio + Newspaper, data = advertising)
  
  expect_equal(r_squared(x), 0.897)
  expect_length(r_squared(x), 1)
  expect_type(r_squared(x), 'double')
})


test_that("residual standard error", {
  advertising <- read.csv("../data/Advertising.csv", header = TRUE)
  x <- lm(Sales ~ TV + Radio + Newspaper, data = advertising)
  
  expect_equal(residual_std_error(x), 1.69)
  expect_length(residual_std_error(x), 1)
  expect_type(residual_std_error(x), 'double')
})