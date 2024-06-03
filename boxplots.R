library(ggplot2)
library(gridExtra)

sepsis_prevalence <- c(48.3, NA, 25.5, 29.5, 8.5, 5.2, 50.0, 0.3, 29.0, 1.6, 4.8, 21.0, 9.7, 0.9, 25.4, NA, 39.0, 20.0, 0.5, 28.9, 49.8, 3.5, 4.0, 35.6, 4.7, 11.0)
sample_size <- c(1887, 52229, 3100, 178843, 2318, 180000, 4000, 537837, 1400, 41678, 370051, 8296, 49560, 133707, 31591, 468, 698, 375, 35074, 1840, 1663, 1059386, 8274, 1572, 13598, 2484)
variable_numbers <- c(43, 30, 86, 48, 20, 40, NA, 46, 24, 9, 40, 35, NA, NA, 24, 14, 12, 70, 76, 48, 24, NA, 25, 12, 15, 21)

data <- data.frame(
  Sepsis_Prevalence = sepsis_prevalence,
  Sample_Size = sample_size,
  Variable_Numbers = variable_numbers
)

data <- na.omit(data)

p1 <- ggplot(data, aes(x = Sepsis_Prevalence, y = "")) +
  geom_boxplot(outlier.shape = NA, fill = NA, color = "black") +
  geom_point(position = position_jitter(height = 0), size = 1, color = "black") +
  theme_minimal() +
  labs(title = "Sepsis Prevalence among Patients", x = "Sepsis prevalence (in %)", y = "") +
  theme(
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank()
  ) +
  scale_x_continuous(breaks = seq(0, 100, by = 10), limits = c(0, 100))

p2 <- ggplot(data, aes(x = Variable_Numbers, y = "")) +
  geom_boxplot(outlier.shape = NA, fill = NA, color = "black") +
  geom_point(position = position_jitter(height = 0), size = 1, color = "black") +
  theme_minimal() +
  labs(title = "Feature Numbers", x = "Feature Numbers", y = "") +
  theme(
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank()
  ) +
  scale_x_continuous(breaks = seq(0, 100, by = 10), limits = c(0, 100))

grid.arrange(p1, p2, ncol = 1)
