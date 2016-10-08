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



save_pdf = function(file, title) {
  pdf(paste0("images/", title))
  print(file)
  dev.off()
}

save_png = function(file, title) {
  png(paste0("images/", title))
  print(file)
  dev.off()  
}

# Histograms & Scatterplot
## Histogram of TV
hist_tv = ggplot(data, aes(x = TV)) + geom_histogram(binwidth = 10) + ggtitle("Histogram of TV") + xlab("Budgets on TV, in thousands of dollars")
save_pdf(hist_tv, "histogram-tv.pdf")
save_png(hist_tv, "histogram-tv.png")

## Histogram of Sales
hist_sales = ggplot(data, aes(x = Sales)) + geom_histogram(binwidth = 2) + ggtitle("Histogram of Sales") + xlab("Sales, in thousands of units")
save_pdf(hist_sales, "histogram-sales.pdf")
save_png(hist_sales, "histogram-sales.png")

