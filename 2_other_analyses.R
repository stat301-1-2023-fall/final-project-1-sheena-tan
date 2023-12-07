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

# Most liked teacher in each department
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

# Least liked teacher in each department
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

## ANALYSIS 12 ----

# Most positive CTECs
plot12a <- ctec_data_short |> 
  arrange(desc(essay_sentiment))  |> 
  kable("html") |> 
  kable_styling(full_width = FALSE, font_size = 8) 

writeLines(as.character(plot12a), "figures/exploratory_positive_ctecs.html")

# Least positive CTECs
plot12b <- ctec_data_short |> 
  arrange(essay_sentiment) |> 
  kable("html") |> 
  kable_styling(full_width = FALSE, font_size = 8) 

writeLines(as.character(plot12b), "figures/exploratory_negative_ctecs.html")

  
## ANALYSIS 13 ----
# for classes with more than one teacher...
plot13 <- ctec_data |> 
  distinct(instructor, .keep_all = TRUE) |> 
  group_by(dept, course_num) |> 
  filter(n_distinct(instructor) > 1) |> 
  # ... who taught it best?
  slice_max(inst_combined_rating) |>
  select(school, dept, course_num, course_term, instructor, inst_combined_rating,
         course_rating, learn_rating, interest_rating, hours_spent) |>
  kable("html") |> 
  kable_styling(full_width = FALSE, font_size = 8) 

writeLines(as.character(plot13), "figures/exploratory_multiple_teachers.html")


## ANALYSIS 14 ----
# create course_level variable
level_data <- ctec_data |> 
  mutate(
    course_level = case_when(
      between(course_num, 100, 199) ~ "100",
      between(course_num, 200, 299) ~ "200",
      course_num >= 300 ~ "300",
      TRUE ~ "Other"
    )
  )

# boxplot of learning by course level
plot14a <- ggplot(level_data, aes(learn_rating, fill = course_level)) +
  geom_boxplot() +
  scale_fill_manual(values = c("#B6ACD1", "#836EAA", "#4E2A84")) +
  theme_fivethirtyeight() +
  theme(
    axis.title.x = element_text(size = 8),
    axis.title.y = element_text(size = 8),
    axis.text.y = element_blank(),
    title = element_text(size = 8),
    legend.title = element_blank()
  ) +
  labs(
    title = "Amount learned rating by course level", 
    x = "amount learned rating",
    y = NULL
  )

ggsave("figures/course_level_boxplot.png", plot14a, width = 6, height = 4, units = "in")

# scatterplot of learning vs hours spent by course level
plot14b <- 
  ggplot(level_data, aes(hours_spent, learn_rating, color = course_level)) +
  geom_point(stat = "identity") +
  scale_color_manual(values = c("#B6ACD1", "#836EAA", "#4E2A84")) +
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

ggsave("figures/course_level_scatterplot.png", plot14b, width = 6, height = 4, units = "in")













