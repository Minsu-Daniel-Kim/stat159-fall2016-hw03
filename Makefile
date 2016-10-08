# .PHONY: all data clean

# all: report/report.pdf data/eda-output.txt data/regression.RData data/eda-output.txt

# data: 
# 	curl -0 http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv > data/Advertising.csv

# data/regression.RData: code/regression-script.R code/eda-script.R data/Advertising.csv
	
# code/regression-script.R: 
# 	Rscript code/regression-script.R

# data/eda-output.txt: code/eda-script.R data/Advertising.csv

# code/eda-script.R:
# 	Rscript code/eda-script.R

# report/report.pdf: report/report.Rmd data/regression.RData code/eda-script.R code/regression-script.R
# 	pandoc -s report/report.Rmd -o report/report.pdf
	

# clean: 
# 	rm -f $(R)/report.pdf

D = data
C = code
R = report
I = images

.PHONY: all data clean

all: $(R)/report.pdf $(D)/eda-output.txt $(D)/regression.RData

data: 
	curl -0 http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv > $(D)/Advertising.csv

$(D)/regression.RData: $(C)/regression-script.R $(D)/Advertising.csv
	Rscript $(C)/regression-script.R

$(D)/eda-output.txt: $(C)/eda-script.R $(D)/Advertising.csv
	Rscript $(C)/eda-script.R

$(R)/report.pdf: $(R)/report.Rmd $(D)/regression.RData $(I)/scatterplot-tv-sales.png
	pandoc -s $(R)/report.Rmd -o $(R)/report.pdf

clean: 
	rm -f $(R)/report.pdf