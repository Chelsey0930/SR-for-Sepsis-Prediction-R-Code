library(ggplot2)

data <- data.frame(
  Study = rep(c("Lauritsen et al.", "Bedoya et al.", "Zhang et al.", "Wardi et al.", 
                "Shashikumar et al.", "Henry et al.", "Brann et al."), 
              times = c(4, 1, 1, 5, 2, 3, 3)),
  Time = c(-24, -10, -3, -0.25, -5, -4, -36, -24, -16, -12, -8, -4.5, -0.8, 
           -12, -5, -1, -12, -5, -1),
  AUROC = c(0.619, 0.751, 0.871, 0.872, 0.882, 0.892, 0.78, 0.81, 0.83, 0.84, 
            0.86, 0.938, 0.945, 0.94, 0.96, 0.97, 0.94, 0.96, 0.97)
)

ggplot(data, aes(x = Time, y = AUROC, color = Study)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = FALSE, aes(group = Study), fullrange = TRUE, size = 0.5) +
  labs(title = "AUROC Values at Different Prediction Times",
       x = "Prediction Hours",
       color = "Study") +
  theme_minimal() +
  scale_x_continuous(breaks = seq(-40, 0, by = 5), labels = seq(-40, 0, by = 5)) +
  theme(
    plot.title = element_text(hjust = 0.5),
    legend.position = "bottom",
    panel.border = element_rect(color = "black", fill = NA)
  ) +
  scale_y_continuous(position = "right")
