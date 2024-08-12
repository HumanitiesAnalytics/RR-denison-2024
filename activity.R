# This example is taken from a DA 101 lab written before I started at Denison. 
# It was iterated on several times by various instructors, but the original lab 
# asked students to load two CSV files: one with Airbnb rental data, and one with 
# Columbus landmarks, with the idea of seeing if a rental's distance to its nearest 
# landmark could work as a predictor of price. 

# The code below represents a simplified version of the code from that lab. It does the following:
  # (1) loads the Airbnb and landmark data 
  # (2) merges the separate CSVs
  # (3) calculates the distance of each Airbnb to each landmark
  # (4) merges nearest landmark distance with Airbnb price data 
  # (5) visualizes the relationship between nearest landmark distance and price as a scatter plot 

# !! Note: !!

# I've tampered with this code in some hopefully-instructional ways. 
# Try running the code cells below, and see if you can resolve any errors you encounter.

# Don't worry if any of the code is outside your areas of familiarity or comfort.
# The whole point of this exercise is to think about what's difficult to address when reproducing 
# someone else's code without some support. 

library(tidyverse)
library(Imap)

landmarks <- read_csv('/Users/mathewlavin/Sandbox/teaching/RR-denison-2024/data/cbus_landmarks.csv')
cbus_airbnb <- read_csv('/Users/mathewlavin/Sandbox/teaching/RR-denison-2024/data/Columbus_listings.csv')
cbus_airbnb <- cbus_airbnb %>% mutate(price_float = as.numeric(str_replace_all(price, "[$,]","")))

airbnb_lat_lng <- cbus_airbnb %>% select('id', 'latitude', 'longitude')
landmarks[['zipper']] = 1 
airbnb_lat_lng[['zipper']] = 1 

loc_pairs <- left_join(airbnb_lat_lng, landmarks, join_by(zipper == zipper), suffix = c("_listing", "_landmark"), relationship = "many-to-many")

distances <- loc_pairs %>% mutate(distance = gdist(long1, lat1, long2, lat2, units="miles"))

nearest <- distances %>% group_by(id) %>% arrange(distance) %>% summarise(nearest_landmark=first(landmark), distance=first(distance))

rejoined <- cbus_airbnb %>% left_join(nearest, join_by(id == id)) %>% select(nearest_landmark, distance, price_float)

ggplot(rejoined, aes(x = distance, y = price_float, color = nearest_landmark)) + geom_point() + labs(x = "Distance", y = "Price", title = "Distance and Price Comparison") + geom_smooth(method = "lm", color = "blue")