
# read from Advertising.csv
advertising = read.csv("data/Advertising.csv")
advertising.model = lm(sales ~ ., data = advertising)
advertising.model = lm(sales ~ . -newspaper, data = advertising)
advertising.model.summary = summary(advertising.model)

# save to regression.RData
save(advertising.model, advertising.model.summary, file = "data/regression.RData")

# residual-plot.png
png("images/residual-plot.png")
plot(advertising.model, which = c(1))
dev.off()

# normal-qq-plot.png
png("images/normal-qq-plot.png")
plot(advertising.model, which = c(2))
dev.off()

# scale-location-plot.png
png("images/scale-location-plot.png")
plot(advertising.model, which = c(3))
dev.off()

# scatterplot-tv-sales.png
png("images/scatterplot-tv-sales.png")
plot(advertising$TV, advertising$sales, xlab = "Budgets on TV, in thousands of dollars", ylab = "Sales, in thousands of units", main = "Scatterplot TV sales", col = "red")
# abline(advertising.model, col = "blue")
dev.off()

# scatterplot-radio-sales.png
png("images/scatterplot-radio-sales.png")
plot(advertising$radio, advertising$sales, xlab = "Budgets on TV, in thousands of dollars", ylab = "Sales, in thousands of units", main = "Scatterplot radio sales", col = "red")
# abline(advertising.model, col = "blue")
dev.off()

# scatterplot-newspaper-sales.png
png("images/scatterplot-newspaper-sales.png")
plot(advertising$newspaper, advertising$sales, xlab = "Budgets on TV, in thousands of dollars", ylab = "Sales, in thousands of units", main = "Scatterplot newspaper sales", col = "red")
# abline(advertising.model, col = "blue")
dev.off()

