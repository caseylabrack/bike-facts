library(tidyverse)
library(lubridate)

# data = read_csv("201812-capitalbikeshare-tripdata.csv") %>% 
data = read_csv("data-2018.csv") %>% 
  mutate(startDate = ymd_hms(startDate)) %>% 
  mutate(time = hour(startDate))

ggplot(data, aes(time)) +
  geom_bar(fill = "#d79544") +
  scale_x_continuous(breaks = c(9,12,17), labels = c("9am", "noon", "5pm"), expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0)) +
  labs(title = "People Use Bikeshare to Commute", subtitle = "Rides by hour of the day") +
  theme(axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        panel.background = element_blank(),
        plot.subtitle = element_text(hjust = 0, face = "italic",
                                    margin = margin(t = 0, r = 0, b = 24, l = 0, unit = "pt")))

ggsave("_export/time-of-day.png", width = 5.5, height = 2.75, dpi = 300, unit = "in")