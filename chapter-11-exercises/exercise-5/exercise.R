# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
grouped <- group_by(flights, month)
grouped
dep_delay_by_month <- summarize(grouped, mean_dep_delay = mean.default(dep_delay, na.rm = TRUE))
dep_delay_by_month
# Which month had the greatest average departure delay?

# JULY

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function

plot(dep_delay_by_month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
grouped_two <- group_by(flights, dest)
arrival_delay_dest <- summarize(grouped_two, mean_arr_delay = mean.default(arr_delay, na.rm = TRUE))
arrange(arrival_delay_dest, desc(mean_arr_delay))

# CAE

# You can look up these airports in the `airports` data frame!
View(airports)

# Which city was flown to with the highest average speed?

# no city or speed columns