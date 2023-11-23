# install packages
library(tidyverse)
library(ggthemes)
library(patchwork)
library(cowplot)

# separate data by school
mcmk_data <- ctec_data[ctec_data$school == 'mcmk', ]
jour_data <- ctec_data[ctec_data$school == 'jour', ]
comm_data <- ctec_data[ctec_data$school == 'comm', ]
bien_data <- ctec_data[ctec_data$school == 'bien', ]
sesp_data <- ctec_data[ctec_data$school == 'sesp', ]
wnbg_data <- ctec_data[ctec_data$school == 'wnbg', ]

# averages of time spent across schools
labels <- c("mcmk", "jour", "comm", "bien", "sesp", "wnbg")
means_hours <- c(
  mean(mcmk_data$hours_spent),
  mean(jour_data$hours_spent),
  mean(comm_data$hours_spent),
  mean(bien_data$hours_spent),
  mean(sesp_data$hours_spent),
  mean(wnbg_data$hours_spent)
)
avg_hours <- data.frame(labels, means_hours)

# bar plot of hours spent across schools
plot1 <- ggplot(avg_hours, aes(x = labels, y = means_hours, fill = labels)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(
    values = c(
      "#836EAA",
      "#B6ACD1",
      "#836EAA",
      "#4E2A84",
      "#B6ACD1",
      "#B6ACD1"
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
    title = "Average hours per week spent per class", 
    x = "school", 
    y = "time spent (hrs)"
  )

ggsave("schools_hours_spent.png", plot1, width = 6, height = 4, units = "in")
