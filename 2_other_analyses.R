# install packages
library(tidyverse)
library(knitr)
library(kableExtra)
library(ggthemes)
library(patchwork)
library(cowplot)

## ANALYSIS 10 ---- 
# exploratory: scatterplot of essay_sentiment and course_rating
plot10a <- ggplot(ctec_data_short, aes(course_rating, essay_sentiment, color = school)) +
  geom_point(stat = "identity") +
  scale_color_manual(
    values = c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#8c564b")
  ) +
  theme_fivethirtyeight() +
  theme(
    axis.title.x = element_text(size = 8),
    axis.title.y = element_text(size = 8),
    axis.text.y = element_blank(),
    title = element_text(size = 8),
    legend.title = element_blank()
  ) +
  labs(
    title = "Scatterplot of essay_sentiment and course_rating", 
    y = "essay_sentiment",
    x = "course_rating"
  )

# exploratory: scatterplot of course_rating and challenge_rating
plot10b <- ggplot(ctec_data, aes(course_rating, challenge_rating, color = school)) +
  geom_point(stat = "identity") +
  scale_color_manual(
    values = c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#8c564b")
  ) +
  theme_fivethirtyeight() +
  theme(
    axis.title.x = element_text(size = 8),
    axis.title.y = element_text(size = 8),
    axis.text.y = element_blank(),
    title = element_text(size = 8),
    legend.title = element_blank()
  ) +
  labs(
    title = "Scatterplot of course_rating and challenge_rating", 
    x = "course_rating",
    y = "challenge_rating"
  )

ggsave("figures/exploratory_course_measure1.png", plot10a, width = 6, height = 4, units = "in")
ggsave("figures/exploratory_course_measure2.png", plot10b, width = 6, height = 4, units = "in")


## ANALYSIS 11 ----
# Most liked and most hated teacher in each department

plot11a <- ctec_data |>
  group_by(dept) |>  
  slice_max(inst_combined_rating) |> 
  distinct(instructor, .keep_all = TRUE) |> 
  select(school, dept, course_num, course_term, instructor, inst_combined_rating,
         course_rating, learn_rating, interest_rating, hours_spent) |>
  arrange(desc(learn_rating)) |> 
  kable("html") |> 
  kable_styling(full_width = FALSE, font_size = 8)

writeLines(as.character(plot11a), "figures/exploratory_most_liked_teacher.html")

plot11b <- ctec_data |>
  group_by(dept) |>  
  slice_min(inst_combined_rating) |> 
  distinct(instructor, .keep_all = TRUE) |> 
  select(school, dept, course_num, course_term, instructor, inst_combined_rating,
         course_rating, learn_rating, interest_rating, hours_spent) |>
  arrange(desc(learn_rating)) |> 
  kable("html") |> 
  kable_styling(full_width = FALSE, font_size = 8)

writeLines(as.character(plot11b), "figures/exploratory_least_liked_teacher.html")

# Which classes have the most opinionated CTECs, either good or bad? 
  
# see which sentiment analyses are the most positive and most negative



