
# read from Advertising.csv
data = read.csv("data/Advertising.csv")

# linear model fitting
model.lm = lm(Sales ~ TV, data = data)

# save model
save(model.lm, file = "data/regression.RData")

pdf("images/scatterplot-tv-sales.pdf")
plot(data$TV, data$Sales, xlab = "Budgets on TV, in thousands of dollars", ylab = "Sales, in thousands of units", main  = "Scatterplot TV sales", col = "red")
abline(model.lm, col = "blue") 
dev.off()

png("images/scatterplot-tv-sales.png")
plot(data$TV, data$Sales, xlab = "Budgets on TV, in thousands of dollars", ylab = "Sales, in thousands of units", main = "Scatterplot TV sales", col = "red")
abline(model.lm, col = "blue")
dev.off()



# get model summary
model.summary = summary(model.lm)
model.summary

