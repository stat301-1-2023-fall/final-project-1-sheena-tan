# install packages
library(tidyverse)
library(tidytext)
library(textdata)
library(ggthemes)
library(patchwork)
library(cowplot)

## ANALYSIS 1 ----

# averages of time spent by school
avg_hours <- ctec_data |> 
  group_by(school) |> 
  summarise(hours = mean(hours_spent))

# bar plot of hours spent across schools
plot1 <- ggplot(avg_hours, aes(school, hours, fill = school)) +
  geom_histogram(stat = "identity") +
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

ggsave("figures/schools_hours_spent.png", plot1, width = 6, height = 4, units = "in")



## ANALYSIS 2 ----

# averages of amount learned by schools
avg_learned <- ctec_data |> 
  group_by(school) |> 
  summarise(hours = mean(learn_rating))

# bar plot of hours spent across schools
plot2 <- ggplot(avg_learned, aes(school, hours, fill = school)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(
    values = c(
      "#B6ACD1",
      "#836EAA",
      "#B6ACD1",
      "#4E2A84",
      "#B6ACD1",
      "#4E2A84"
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

ggsave("figures/schools_amount_learned.png", plot2, width = 6, height = 4, units = "in")



## ANALYSIS 3 ----

# scatterplot of amount learned vs hours spent by school
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

ggsave("figures/time_learning_scatterplot.png", plot3, width = 6, height = 4, units = "in")



## ANALYSIS 4 ----

# bienen
bien_data <- ctec_data |> filter(school == "bien")
plot4a <- ggplot(bien_data, aes(hours_spent, learn_rating)) +
  geom_point(stat = "identity", color = "#1f77b4") +
  theme_fivethirtyeight() +
  theme(
    title = element_text(size = 8),
    axis.title.x = element_text(size = 8, margin = margin(t = 10)),
    axis.title.y = element_text(size = 8, margin = margin(r = 10)),
    legend.position = "none",
    legend.title = element_blank()
  ) +
  labs(
    title = "Bienen", 
    x = "time spent (hrs)", 
    y = "amount learned"
  )

# comms
comm_data <- ctec_data |> filter(school == "comm")
plot4b <- ggplot(comm_data, aes(hours_spent, learn_rating)) +
  geom_point(stat = "identity", color = "#ff7f0e") +
  theme_fivethirtyeight() +
  theme(
    title = element_text(size = 8),
    axis.title.x = element_text(size = 8, margin = margin(t = 10)),
    axis.title.y = element_text(size = 8, margin = margin(r = 10)),
    legend.position = "none",
    legend.title = element_blank()
  ) +
  labs(
    title = "Comms", 
    x = "time spent (hrs)", 
    y = "amount learned"
  )

# Medill
jour_data <- ctec_data |> filter(school == "jour")
plot4c <- ggplot(jour_data, aes(hours_spent, learn_rating)) +
  geom_point(stat = "identity", color = "#2ca02c") +
  theme_fivethirtyeight() +
  theme(
    title = element_text(size = 8),
    axis.title.x = element_text(size = 8, margin = margin(t = 10)),
    axis.title.y = element_text(size = 8, margin = margin(r = 10)),
    legend.position = "none",
    legend.title = element_blank()
  ) +
  labs(
    title = "Medill", 
    x = "time spent (hrs)", 
    y = "amount learned"
  )

# McCormick
mcmk_data <- ctec_data |> filter(school == "mcmk")
plot4d <- ggplot(mcmk_data, aes(hours_spent, learn_rating)) +
  geom_point(stat = "identity", color = "#d62728") +
  theme_fivethirtyeight() +
  theme(
    title = element_text(size = 8),
    axis.title.x = element_text(size = 8, margin = margin(t = 10)),
    axis.title.y = element_text(size = 8, margin = margin(r = 10)),
    legend.position = "none",
    legend.title = element_blank()
  ) +
  labs(
    title = "McCormick", 
    x = "time spent (hrs)", 
    y = "amount learned"
  )

# SESP
sesp_data <- ctec_data |> filter(school == "sesp")
plot4e <- ggplot(sesp_data, aes(hours_spent, learn_rating)) +
  geom_point(stat = "identity", color = "#9467bd") +
  theme_fivethirtyeight() +
  theme(
    title = element_text(size = 8),
    axis.title.x = element_text(size = 8, margin = margin(t = 10)),
    axis.title.y = element_text(size = 8, margin = margin(r = 10)),
    legend.position = "none",
    legend.title = element_blank()
  ) +
  labs(
    title = "SESP", 
    x = "time spent (hrs)", 
    y = "amount learned"
  )

# Weinberg
wnbg_data <- ctec_data |> filter(school == "wnbg")
plot4f <- ggplot(wnbg_data, aes(hours_spent, learn_rating)) +
  geom_point(stat = "identity", color = "#8c564b") +
  theme_fivethirtyeight() +
  theme(
    title = element_text(size = 8),
    axis.title.x = element_text(size = 8, margin = margin(t = 10)),
    axis.title.y = element_text(size = 8, margin = margin(r = 10)),
    legend.position = "none",
    legend.title = element_blank()
  ) +
  labs(
    title = "Weinberg", 
    x = "time spent (hrs)", 
    y = "amount learned"
  )

(plot4a + plot4c + plot4e)/(plot4b + plot4d + plot4f)
ggsave2("figures/time_learning_schools_scatterplot.png", width = 6, height = 4, units = "in")


## ANALYSIS 5 ----
# averages of new instructor measure by school
ctec_data <- ctec_data |> 
  mutate(inst_combined_rating = inst_rating + interest_rating) 

avg_inst_rating <- ctec_data |> 
  group_by(school) |> 
  summarize(means = mean(inst_combined_rating))

# bar plot of instructor rating across schools
plot5 <- ggplot(avg_inst_rating, aes(school, means, fill = school)) +
  geom_histogram(stat = "identity") +
  scale_fill_manual(
    values = c(
      "#836EAA",
      "#4E2A84",
      "#B6ACD1",
      "#836EAA",
      "#836EAA",
      "#4E2A84"
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
    title = "Average rating of instruction", 
    x = "school", 
    y = "rating"
  )

ggsave("figures/schools_instruction_rating.png", plot5, width = 6, height = 4, units = "in")



## ANALYSIS 6 ----
# scatterplot of amount learned vs instructor rating by school
plot6 <- ggplot(ctec_data, aes(inst_combined_rating, learn_rating, color = school)) +
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
    title = "Amount learned rating vs. instructor rating, per course", 
    x = "instructor rating", 
    y = "amount learned rating"
  )

ggsave("figures/instructor_learning_scatterplot.png", plot6, width = 6, height = 4, units = "in")


## ANALYSIS 7 ----

# exploratory: scatterplot of course_rating and challenge_rating
# ggplot(ctec_data, aes(course_rating, challenge_rating, color = school)) +
#   geom_point(stat = "identity") +
#   scale_color_manual(
#     values = c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#8c564b")
#   )

# averages of course rating by schools
avg_course_rating <- ctec_data |> 
  group_by(school) |> 
  summarise(rating = mean(course_rating))

# bar plot of hours spent across schools
plot7 <- ggplot(avg_course_rating, aes(school, rating, fill = school)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(
    values = c(
      "#B6ACD1",
      "#4E2A84",
      "#836EAA",
      "#836EAA",
      "#836EAA",
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
    title = "Average rating of courses", 
    x = "school", 
    y = "course rating"
  )

ggsave("figures/schools_course_rating.png", plot7, width = 6, height = 4, units = "in")


## ANALYSIS 8 ----

# AFINN lexicon rating sentiment keywords from -5 to 5 
lexicon <- get_sentiments("afinn")

# sentiment analysis
ctec_data_short <- ctec_data |> 
  # split essay column responses into tokens, flattening into one-token-per-row
  unnest_tokens(word, essay) |> 
  inner_join(lexicon) |> 
  # sum per course
  group_by(school, dept, course_num, course_term, instructor, inst_rating, 
           course_rating, learn_rating, challenge_rating, interest_rating, 
           hours_spent) |> 
  summarize(essay_sentiment = sum(value) / n())

# averages of sentiment rating by schools
avg_sentiment <- ctec_data_short |> 
  group_by(school) |> 
  summarise(sentiment = mean(essay_sentiment))

# box plot of sentiment rating across schools
plot8 <- ctec_data_short |> 
  ggplot(aes(essay_sentiment, fill = school)) +
  geom_boxplot() +
  theme_fivethirtyeight() +
  theme(
    axis.title.x = element_text(size = 8),
    axis.title.y = element_text(size = 8),
    axis.text.y = element_blank(),
    title = element_text(size = 8),
    legend.title = element_blank()
  ) +
  labs(
    title = "Average sentiment rating of courses", 
    x = "sentiment rating",
    y = NULL
  )

ggsave("figures/schools_sentiment_rating.png", plot8, width = 6, height = 4, units = "in")


















