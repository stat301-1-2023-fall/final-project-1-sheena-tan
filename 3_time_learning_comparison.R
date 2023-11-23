# install packages
library(tidyverse)
library(ggthemes)
library(patchwork)
library(cowplot)

# scatterplot of amount learned by hours spent across schools
plot3 <- ggplot(ctec_data, aes(hours_spent, learn_rating, color = school)) +
  geom_point(stat = "identity") +
  scale_color_manual(
    values = c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#8c564b")
  ) +
  theme_fivethirtyeight() +
  theme(
    title = element_text(size = 8),
    axis.title.x = element_text(size = 8),
    axis.title.y = element_text(size = 8),
    legend.position = c(1, 0),
    legend.justification = c(1, 0),
    legend.title = element_blank()
  ) +
  labs(
    title = "Amount learned rating vs. hours spent, per course", 
    x = "time spent (hrs)", 
    y = "rating of amount learned"
  )

ggsave("time_learning_scatterplot.png", plot3, width = 6, height = 4, units = "in")

