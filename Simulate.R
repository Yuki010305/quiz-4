install.packages("janitor")
library("janitor")
install.packages("knitr")
library("knitr")
install.packages("lubridate")
library("lubridate")
install.packages("tidyverse")
library("tidyverse")


set.seed(0) 

n_friends <- 20

true_heights <- rnorm(n_friends, mean = 170, sd = 10)

edward_errors <- rnorm(n_friends, mean = 0, sd = 1.5)
hugo_errors <- rnorm(n_friends, mean = -0.5, sd = 1)
lucy_errors <- rnorm(n_friends, mean = 0.5, sd = 2)

edward_measurements <- true_heights + edward_errors
hugo_measurements <- true_heights + hugo_errors
lucy_measurements <- true_heights + lucy_errors

measurements_df <- data.frame(
  Edward = edward_measurements,
  Hugo = hugo_measurements,
  Lucy = lucy_measurements
)

ttest_edward_hugo <- t.test(measurements_df$Edward, measurements_df$Hugo)

ttest_hugo_lucy <- t.test(measurements_df$Hugo, measurements_df$Lucy)

corr_edward_lucy <- cor.test(measurements_df$Edward, measurements_df$Lucy)

list(ttest_edward_hugo, ttest_hugo_lucy, corr_edward_lucy)


