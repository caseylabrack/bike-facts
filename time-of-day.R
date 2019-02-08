library(tidyverse)
library(lubridate)

data = read_csv("201812-capitalbikeshare-tripdata.csv") %>% 
  mutate(startDate = mdy_hm(startDate)) %>% 
  mutate(time = hour(startDate))

ggplot(data, aes(time)) +
  geom_bar(fill = "#d79544") +
  scale_x_continuous(breaks = c(9,12,17), labels = c("9am", "noon", "5pm"), name ="", expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0)) +
  labs(title = "When People Are Riding Bikeshare", caption = "Bikeshare use peaks around commuting hours.") +
  theme(axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        panel.background = element_blank(),
        plot.caption = element_text(hjust = 0),
        plot.title = element_text(margin = margin(t = 0, r = 0, b = 24, l = 0, unit = "pt")))

ggsave("time-of-day.pdf", width = 5.5, height = 2.75, unit = "in")
ggsave("time-of-day.png", width = 5.5, height = 2.75, dpi = 300, unit = "in")