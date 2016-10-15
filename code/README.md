
### File structure

```
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
```

### functions/regression-functions.R contains functions used in this analysis
  * Residual Sum of Squares
  * Total Sum of Squares
  * R squared
  * F statistics
  * Residual Standard Error

### scripts folder has three files eda-script.R, regression-script.R, session-info-script.R
  * eda-script.R: reads in the Advertising.csv data set, and computes summary statistics, histograms for all the variables (TV, Radio, Newspaper, and Sales), matrix of correlations among all variables, and scatterplot-matrix (pairwise scatterplots). 
  * regression-script.R: reads in the Advertising.csv data set, and computes a "regression" object---via lm()---as well as the summary of such regression object---via summary().
  * session-info-script.R: is a script that includes library() calls to ALL the packages that you use for your project, as well as the output of the function sessionInfo().
  * tests: hold all the related unit tests on functions to compare expected and actual output

**Minsu Kim**
<div>
University of California, Berkeley </br>
Berkeley CA, 94072 USA </br>
kaj011@berkeley.edu
</div>
### LICENSE

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.