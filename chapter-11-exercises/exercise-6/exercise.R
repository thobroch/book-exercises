# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")
View(airports)
# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
destination_group <- group_by(flights, dest)
average_arr_delays_by_dest <- summarize(destination_group, mean_arr_delays = mean.default(arr_delay, na.rm = TRUE))
left_join(average_arr_delays_by_dest, airports, by = "name")

# San Francisco Airport

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
airline_group <- group_by(flights, carrier)
average_arr_delays_by_airline <- summarize(airline_group, mean_arr_delays = mean.default(arr_delay, na.rm = TRUE))
left_join(average_arr_delays_by_airline, airlines, by = "carrier")
# Alaska Airlines
