# import libraries
library(data.table)
library(ggplot2)
library(dplyr)

# Download file from the website
file = fread('http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv')

# export in csv format
write.csv(file, "data/Advertising.csv", row.names = FALSE)

# read from Advertising.csv
data = read.csv("data/Advertising.csv")

# summary statistics
sink("data/eda-output.txt")
print("Summary Statistics of TV and Sales")
summary(select(data, TV, Sales))
sink()


# Histograms & Scatterplot
## Histogram of TV
pdf("images/histogram-tv.pdf")
ggplot(data, aes(x = TV)) + geom_histogram(binwidth = 10) + ggtitle("Histogram of TV") + xlab("Budgets on TV, in thousands of dollars")
dev.off()

png("images/histogram-tv.png")
ggplot(data, aes(x = TV)) + geom_histogram(binwidth = 10) + ggtitle("Histogram of TV") + xlab("Budgets on TV, in thousands of dollars")
dev.off()

## Histogram of Sales
png("images/histogram-sales.png")
ggplot(data, aes(x = Sales)) + geom_histogram(binwidth = 2) + ggtitle("Histogram of Sales") + xlab("Sales, in thousands of units")
dev.off()

pdf("images/histogram-sales.pdf")
ggplot(data, aes(x = Sales)) + geom_histogram(binwidth = 2) + ggtitle("Histogram of Sales") + xlab("Sales, in thousands of units")
dev.off()



