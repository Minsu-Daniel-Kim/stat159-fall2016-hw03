## STAT159 HW03

### Objective 
In this analysis, I explore the statistical relationship between advertising budget and its effectiveness. In particular, I focus on the linear relationship between the increase in three predictors, namely, TV, radio and newspapers and the increase in the number of items sold by reproducing the results from the book, An Introduction to Statistical Learning. To analyze the effect of these indicators, I fit a multiple linear regression on data.


### File structure

```
stat159-fall2016-hw03/
	README.md
	LICENSE
	Makefile
	session-info.txt                     # produced by session-info-script.R
	code/
	  README.md
	  test-that.R
	  functions/
	    regression-functions.R
	  scripts/
	    eda-script.R
	    regression-script.R
	    session-info-script.R
	  tests/
	    test-regression.R
	data/
	  README.md
	  Advertising.csv
	  eda-output.txt                      # produced by eda-script.R
	  correlation-matrix.RData            # produced by eda-script.R
	  regression.RData                    # produced by regression-script.R
	images/
		histogram-sales.png                # produced by eda-script.R
		histogram-tv.png                   # produced by eda-script.R
		histogram-radio.png                # produced by eda-script.R
		histogram-newspaper.png            # produced by eda-script.R
		scatterplot-matrix.png             # produced by eda-script.R
		scatterplot-tv-sales.png           # produced by regression-script.R
		scatterplot-radio-sales.png        # produced by regression-script.R
		scatterplot-newspaper-sales.png    # produced by regression-script.R
		residual-plot.png                  # produced by regression-script.R
		scale-location-plot.png            # produced by regression-script.R
		normal-qq-plot.png                 # produced by regression-script.R
	report/
		report.Rmd
		report.pdf
```


### How to generate report.pdf
You can easily find a Makefile in stat159-fall2016-hw03 directory. 

> Type 'make' in your terminal. It will automatically generate report.pdf in sections directory.  
> Also if you'd like to remove these files, type 'make clean' to automatically remove them.

### Structure of the paper

> * Abstract
> * Introduction
> * Data
> * Methodology
> * Results
> * Conclusions

**Minsu Kim**
<div>
University of California, Berkeley </br>
Berkeley CA, 94072 USA </br>
kaj011@berkeley.edu
</div>
### LICENSE

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.