image_folder = images
report_folder = report
data_folder = data
code_folder = code


.PHONY: all data clean 

all: $(data_folder)/report.pdf $(data_folder)/eda-output.txt $(data_folder)/regression.RData

data: 
	curl -0 http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv > $(data_folder)

$(data_folder)/regression.RData: $(code_folder)/regression-script.R
	Rscript $(code_folder)/regression-script.R

$(data_folder)/eda-output.txt: $(code_folder)/eda-script.R
	Rscript $(code_folder)/eda-script.R

$(report_folder)/report.pdf: $(report_folder)/report.Rmd $(data_folder)/regression.RData $(image_folder)/scatterplot-tv-sales.png
	pandoc -s $(report_folder)/report.Rmd -o $(report_folder)/report.pdf

clean: 
	rm -f $(report_folder)/report.pdf