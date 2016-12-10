library(testthat)
# loading all function files
files <- list.files("code/functions")
for (i in 1:length(files)) {
  source(paste0("code/functions/", files[i]))
}

# run unit tests in folder 'tests/'
# test_dir("tests", reporter = "Summary")
test_file("code/tests/test-info-script.R")