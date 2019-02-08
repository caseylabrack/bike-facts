library(tidyverse)

data = read_csv("201812-capitalbikeshare-tripdata.csv")

medianDuration = median(data$duration)

ggplot(data, aes(duration)) +
  geom_histogram(binwidth = 10, fill = "#d79544") +
  geom_vline(xintercept = medianDuration, linetype="11") +
  annotate("text", label = "Median\n(9 minutes, 34 seconds)", x = medianDuration + 30, y = Inf, vjust = 1, hjust = 0, 
           lineheight = 1, size = rel(2)) +
  scale_y_continuous(expand = c(0,0)) +
  scale_x_continuous(limits = c(60,60*60), breaks = c(60,seq(0,60*60, 60*15)), labels = function (x) { x / 60}, expand = c(0,0)) +
  labs(title = "Bikeshare Trips Are Short", subtitle = "Distribution of Ride Times in Minutes") +
  theme(axis.title = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(),
        plot.subtitle = element_text(margin = margin(t = 0, r = 0, b = 24, l = 0, unit = "pt"), face = "italic"))

ggsave("_export/duration.png", width = 5.5, height = 2.75, dpi = 300, unit = "in")