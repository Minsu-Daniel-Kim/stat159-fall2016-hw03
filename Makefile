.PHONY: all data clean

all: report/report.pdf data/eda-output.txt data/regression.RData

data: 
	curl -0 http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv > data/Advertising.csv

data/regression.RData: code/regression-script.R data/Advertising.csv
	Rscript code/regression-script.R

data/eda-output.txt: code/eda-script.R data/Advertising.csv
	Rscript code/eda-script.R

report/report.pdf: report/report.Rmd data/regression.RData images/scatterplot-tv-sales.png
	pandoc -s report/report.Rmd -o report/report.pdf

clean: 
	rm -f report/report.pdf