# variables
CODE = code
DATA = data
SCRIPT = code/scripts
REPORT = report

# Declare PHONY targets
.PHONY: all data tests eda regression report clean

all: data eda regression report

data: 
	curl -o $(DATA)/Advertising.csv "http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv"

regression: $(SCRIPT)/regression-script.R
	Rscript $(SCRIPT)/regression-script.R

eda: $(SCRIPT)/eda-script.R session
	Rscript $(SCRIPT)/eda-script.R

session: $(SCRIPT)/session-info-script.R
	Rscript $(SCRIPT)/session-info-script.R	

report: $(REPORT)/report.Rmd
	cd $(REPORT); Rscript -e 'library(rmarkdown); render("report.Rmd")'

tests: $(CODE)/test-that.R 
	Rscript $(CODE)/test-that.R

clean: 
	rm -f $(REPORT)/report.pdf