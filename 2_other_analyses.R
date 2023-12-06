# install packages
library(tidyverse)
library(ggthemes)
library(patchwork)
library(cowplot)

# exploratory: scatterplot of essay_sentiment and course_rating
ggplot(ctec_data_short, aes(course_rating, essay_sentiment, color = school)) +
  geom_point(stat = "identity") +
  scale_color_manual(
    values = c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#8c564b")
  )

# exploratory: scatterplot of course_rating and challenge_rating
ggplot(ctec_data, aes(course_rating, challenge_rating, color = school)) +
  geom_point(stat = "identity") +
  scale_color_manual(
    values = c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#8c564b")
  )