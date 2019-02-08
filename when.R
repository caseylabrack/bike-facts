library(tidyverse)
library(lubridate)

data = read_csv("201812-capitalbikeshare-tripdata.csv") %>% 
  mutate(startDate = mdy_hm(startDate))

ggplot(data, aes(startDate)) +
  geom_histogram()

ggsave("when.pdf", width = 5.5, height = 2.75, unit = "in")
ggsave("when.png", width = 5.5, height = 2.75, dpi = 300, unit = "in")