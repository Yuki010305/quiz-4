library(ggplot2)

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
  Friend = rep(1:n_friends, 3),
  Height = c(edward_measurements, hugo_measurements, lucy_measurements),
  Measurer = factor(rep(c('Edward', 'Hugo', 'Lucy'), each = n_friends))
)

ggplot(measurements_df, aes(x = Friend, y = Height, color = Measurer)) +
  geom_point() +
  theme_minimal() +
  labs(title = 'Height Measurements by Edward, Hugo, and Lucy',
       x = 'Friend Number',
       y = 'Height (cm)',
       color = 'Measurer') +
  theme(legend.position = "bottom")
