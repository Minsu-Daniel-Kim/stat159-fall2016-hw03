image_folder = images
report_folder = report
data_folder = data
code_folder = code


.PHONY: all clean data

all: $(data_folder)/regression.RData $(data_folder)/eda-output.txt $(data_folder)/report.pdf 

data: 
	curl -0 http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv > $(data_folder)

$(report_folder)/report.pdf: $(report_folder)/report.Rmd $(data_folder)/regression.RData $(image_folder)/scatterplot-tv-sales.png
	pandoc -s $(report_folder)/report.Rmd -o $(report_folder)/report.pdf

$(data_folder)/regression.RData: $(code_folder)/regression-script.R
	$(code_folder)/regression-script.R

$(data_folder)/eda-output.txt: $(code_folder)/eda-script.R
	$(code_folder)/eda-script.R

clean: 
	rm -f $(report_folder)/report.pdf