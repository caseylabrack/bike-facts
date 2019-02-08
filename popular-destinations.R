library(tidyverse)

rawdata = read_csv("201812-capitalbikeshare-tripdata.csv") 

top10 = rawdata %>% 
  group_by(endStation) %>% 
  summarize(total = n()) %>% 
  arrange(-total) %>% 
  top_n(10)



finalData = top10

finalData$endStation = factor(finalData$endStation, levels = rev(finalData$endStation))

ggplot(finalData, aes(endStation, total)) +
  geom_col(fill = "#d79544") +
  scale_x_discrete(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0)) +
  coord_flip() +
  labs(title = "Popular Bikeshare Destinations") +
  theme(axis.text.x = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        panel.background = element_blank(),
        plot.caption = element_text(hjust = 0),
        plot.title = element_text(margin = margin(t = 0, r = 0, b = 24, l = 0, unit = "pt")))

ggsave("popular-destinations.pdf", width = 7, height = 2.75, unit = "in")
ggsave("popular-destinations.png", width = 7, height = 2.75, dpi = 300, unit = "in")