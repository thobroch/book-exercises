# Exercise 4: practicing with dplyr

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
install.packages("nycflights13")
library(nycflights13)

# The data frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)
nrow(flights)
ncol(flights)
colnames(flights)

View(flights)
# Use `dplyr` to give the data frame a new column that is the amount of time
# gained or lost while flying (that is: how much of the delay arriving occured
# during flight, as opposed to before departing).
new_flights <- mutate(flights, amount_of_delay = (arr_time - sched_arr_time))


# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)
arrange(new_flights, desc(amount_of_delay))

# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables to "reset" the data frame
newer_flights <- flights %>% mutate(amount_of_delay = (arr_time - sched_arr_time)) %>% arrange(desc(amount_of_delay))

# Make a histogram of the amount of time gained using the `hist()` function
histogram <- hist(new_flights$amount_of_delay)

# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation

# Lost Time on average

# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain_in_air" column you just created
seattle_flights <- data.frame(filter(new_flights, origin == "SEA", amount_of_delay))
seattle_flights
# On average, did flights to SeaTac gain or loose time?
 # gain time

# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!
flights %>% filter(origin == "JFK") %>% filter(dest == "SEA") %>% mean(air_time, na.rm = TRUE)
