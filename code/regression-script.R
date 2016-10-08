
# read from Advertising.csv
data = read.csv("data/Advertising.csv")

# linear model fitting
model.lm = lm(Sales ~ TV, data = data)
saver
# save model
save(model.lm, file = "data/regression.RData")

# get model summary
model.summary = summary(model.lm)
model.summary

# plot linear model

save_pdf({
  par(cex=.8)
  plot(data$TV, data$Sales, xlab = "Budgets on TV, in thousands of dollars", ylab = "Sales, in thousands of units", main  = "Scatterplot TV sales", col = "red")
  abline(model.lm, col = "blue") 
}, "scatterplot-tv-sales.pdf")

save_png({
  par(cex=.8)
  plot(data$TV, data$Sales, xlab = "Budgets on TV, in thousands of dollars", ylab = "Sales, in thousands of units", main = "Scatterplot TV sales", col = "red")
  abline(model.lm, col = "blue")
}, "scatterplot-tv-sales.png")
