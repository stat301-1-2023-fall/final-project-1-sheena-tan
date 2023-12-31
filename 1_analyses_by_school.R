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
  scale_fill_manual(
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
    title = "Average sentiment rating of courses", 
    x = "sentiment rating",
    y = NULL
  )

ggsave("figures/schools_sentiment_rating.png", plot8, width = 6, height = 4, units = "in")


## ANALYSIS 9 ----

# data wrangling into format for radar chart
radar_data <- avg_course_rating |> 
  right_join(avg_learned, by = "school") |> 
  right_join(avg_inst_rating, by = "school") |>
  # changing scale from out of 12 to out of 6
  mutate(means = means / 2) |> 
  pivot_longer(
    cols = c(rating, hours, means), 
    names_to = "name", 
    values_to = "value"
  ) |> 
  pivot_wider(names_from = school, values_from = value)

# bienen radar chart
plot9a <- ggplot(radar_data, aes(x = name, y = bien)) +
  geom_col(width = 1, fill = "#1f77b4") +
  geom_hline(yintercept = 1:6, linetype = "dotted") +
  geom_segment(x = 0.5:2.5, y = 0, xend = 0.5:2.5, yend = 6) +
  scale_x_discrete(name = NULL, expand = c(0, 0)) +
  scale_y_continuous(name = NULL, expand = c(0, 0)) +
  theme_fivethirtyeight() +
  theme(
    axis.text = element_blank(),
    panel.grid.major = element_blank(),
    axis.ticks = element_blank(),
    title = element_text(size = 8)
  ) +
  labs(title = "Bienen") +
  annotate(
    geom = "text",
    label = c("Learning", "Course", "Instructor"),
    x = c(0.9, 2, 3.1), 
    y = c(8, 7, 8),
    size = 2
  ) +
  coord_polar()

# comm
plot9b <- ggplot(radar_data, aes(x = name, y = comm)) +
  geom_col(width = 1, fill = "#ff7f0e") +
  geom_hline(yintercept = 1:6, linetype = "dotted") +
  geom_segment(x = 0.5:2.5, y = 0, xend = 0.5:2.5, yend = 6) +
  scale_x_discrete(name = NULL, expand = c(0, 0)) +
  scale_y_continuous(name = NULL, expand = c(0, 0)) +
  theme_fivethirtyeight() +
  theme(
    axis.text = element_blank(),
    panel.grid.major = element_blank(),
    axis.ticks = element_blank(),
    title = element_text(size = 8)
  ) +
  labs(title = "Comms") +
  annotate(
    geom = "text",
    label = c("Learning", "Course", "Instructor"),
    x = c(0.9, 2, 3.1), 
    y = c(8, 7, 8),
    size = 2
  ) +
  coord_polar()

# jour
plot9c <- ggplot(radar_data, aes(x = name, y = jour)) +
  geom_col(width = 1, fill = "#2ca02c") +
  geom_hline(yintercept = 1:6, linetype = "dotted") +
  geom_segment(x = 0.5:2.5, y = 0, xend = 0.5:2.5, yend = 6) +
  scale_x_discrete(name = NULL, expand = c(0, 0)) +
  scale_y_continuous(name = NULL, expand = c(0, 0)) +
  theme_fivethirtyeight() +
  theme(
    axis.text = element_blank(),
    panel.grid.major = element_blank(),
    axis.ticks = element_blank(),
    title = element_text(size = 8)
  ) +
  labs(title = "Medill") +
  annotate(
    geom = "text",
    label = c("Learning", "Course", "Instructor"),
    x = c(0.9, 2, 3.1), 
    y = c(8, 7, 8),
    size = 2
  ) +
  coord_polar()

# mcmk
plot9d <- ggplot(radar_data, aes(x = name, y = mcmk)) +
  geom_col(width = 1, fill = "#d62728") +
  geom_hline(yintercept = 1:6, linetype = "dotted") +
  geom_segment(x = 0.5:2.5, y = 0, xend = 0.5:2.5, yend = 6) +
  scale_x_discrete(name = NULL, expand = c(0, 0)) +
  scale_y_continuous(name = NULL, expand = c(0, 0)) +
  theme_fivethirtyeight() +
  theme(
    axis.text = element_blank(),
    panel.grid.major = element_blank(),
    axis.ticks = element_blank(),
    title = element_text(size = 8)
  ) +
  labs(title = "McCormick") +
  annotate(
    geom = "text",
    label = c("Learning", "Course", "Instructor"),
    x = c(0.9, 2, 3.1), 
    y = c(8, 7, 8),
    size = 2
  ) +
  coord_polar()

# sesp
plot9e <- ggplot(radar_data, aes(x = name, y = sesp)) +
  geom_col(width = 1, fill = "#9467bd") +
  geom_hline(yintercept = 1:6, linetype = "dotted") +
  geom_segment(x = 0.5:2.5, y = 0, xend = 0.5:2.5, yend = 6) +
  scale_x_discrete(name = NULL, expand = c(0, 0)) +
  scale_y_continuous(name = NULL, expand = c(0, 0)) +
  theme_fivethirtyeight() +
  theme(
    axis.text = element_blank(),
    panel.grid.major = element_blank(),
    axis.ticks = element_blank(),
    title = element_text(size = 8)
  ) +
  labs(title = "SESP") +
  annotate(
    geom = "text",
    label = c("Learning", "Course", "Instructor"),
    x = c(0.9, 2, 3.1), 
    y = c(8, 7, 8),
    size = 2
  ) +
  coord_polar()

# wnbg
plot9f <- ggplot(radar_data, aes(x = name, y = wnbg)) +
  geom_col(width = 1, fill = "#8c564b") +
  geom_hline(yintercept = 1:6, linetype = "dotted") +
  geom_segment(x = 0.5:2.5, y = 0, xend = 0.5:2.5, yend = 6) +
  scale_x_discrete(name = NULL, expand = c(0, 0)) +
  scale_y_continuous(name = NULL, expand = c(0, 0)) +
  theme_fivethirtyeight() +
  theme(
    axis.text = element_blank(),
    panel.grid.major = element_blank(),
    axis.ticks = element_blank(), 
    title = element_text(size = 8)
  ) +
  labs(title = "Weinberg") +
  annotate(
    geom = "text",
    label = c("Learning", "Course", "Instructor"),
    x = c(0.9, 2, 3.1), 
    y = c(8, 7, 8),
    size = 2
  ) +
  coord_polar()

plot9a + plot9b
ggsave2("figures/radar_bien_comm.png", width = 6, height = 3.3, units = "in")

plot9c + plot9d
ggsave2("figures/radar_jour_mcmk.png", width = 6, height = 3.3, units = "in")

plot9e + plot9f
ggsave2("figures/radar_sesp_wnbg.png", width = 6, height = 3.3, units = "in")







