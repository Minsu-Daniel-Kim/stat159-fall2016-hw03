library(dplyr)
library(ggplot2)
# read from Advertising.csv
data = read.csv("data/Advertising.csv")
df = select(data, TV, Radio, Newspaper, Sales)
colnames(df) = c("TV", "radio", "newspaper", "sales")
write.csv(df, "data/Advertising.csv", row.names = FALSE)

# matrix of correlations
data = read.csv("data/Advertising.csv")
matrix_corr = round(cor(data), 4)
matrix_corr

# pairwise scatterplots
pairs(data, pch = 21)

# summary statistics
sink("data/eda-output.txt")
print("Summary Statistics of TV, Radio, Newspaper and Sales")
summary(data)
print("Matrix of correlations")
matrix_corr
sink()

png("images/scatterplot-matrix.png")
pairs(data, pch = 21)
dev.off()

# save in correlation-matrix.RData
save(matrix_corr, file = "data/correlation-matrix.RData")
           
# computes summary statistics, histograms for all the variables (TV, Radio, Newspaper, and Sales)

# Histograms & Scatterplot
## Histogram of TV
png("images/histogram-tv.png")
ggplot(data, aes(x = TV)) + geom_histogram(binwidth = 10) + ggtitle("Histogram of TV") + xlab("Budgets on TV, in thousands of dollars")
dev.off()

## Histogram of Sales
png("images/histogram-sales.png")
ggplot(data, aes(x = sales)) + geom_histogram(binwidth = 2) + ggtitle("Histogram of Sales") + xlab("Sales, in thousands of units")
dev.off()

## Histogram of Radio
png("images/histogram-radio.png")
ggplot(data, aes(x = radio)) + geom_histogram(binwidth = 2) + ggtitle("Histogram of radio") + xlab("Budgets on radio, in thousands of dollars")
dev.off()

## Histogram of Newspaper
png("images/histogram-newspaper.png")
ggplot(data, aes(x = newspaper)) + geom_histogram(binwidth = 2) + ggtitle("Histogram of newspaper") + xlab("Budgets on newspaper, in thousands of dollars")
dev.off()




