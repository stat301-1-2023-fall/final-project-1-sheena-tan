# install packages
library(tidyverse)
library(ggthemes)
library(patchwork)
library(cowplot)

# averages of amount learned across schools
means_2 <- c(
  mean(mcmk_data$learn_rating),
  mean(jour_data$learn_rating),
  mean(comm_data$learn_rating),
  mean(bien_data$learn_rating),
  mean(sesp_data$learn_rating),
  mean(wnbg_data$learn_rating)
)
avg_learned <- data.frame(labels, means_2)

# bar plot of hours spent across schools
plot2 <- ggplot(avg_learned, aes(x = labels, y = means_2, fill = labels)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(
    values = c(
      "#B6ACD1",
      "#836EAA",
      "#836EAA",
      "#4E2A84",
      "#B6ACD1",
      "#836EAA"
    )
  ) +
  theme_fivethirtyeight() +
  theme(
    axis.title.x = element_text(size = 8),
    axis.title.y = element_text(size = 8),
    title = element_text(size = 8),
    legend.position = "none",
    legend.title = element_blank()
  ) +
  labs(
    title = "Average ratings of amount learned", 
    x = "school", 
    y = "rating of amount learned"
  )

ggsave("schools_amount_learned.png", plot2, width = 6, height = 4, units = "in")
