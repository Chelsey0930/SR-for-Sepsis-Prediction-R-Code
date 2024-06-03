library(ggplot2)
library(dplyr)
library(gridExtra)

algorithms <- data.frame(
  Category = "Algorithm",
  Name = c("Support Vector Machine", "Neural Network", "Random Forest", 
           "Gradient Boosting", "Logistic Regression"),
  Count = c(5, 8, 10, 13, 14)
)

metrics <- data.frame(
  Category = "Metric",
  Name = c("Sensitivity", "Specificity", "Positive Predictive Value", 
           "Negative Predictive Value", "Accuracy"),
  Count = c(23, 21, 16, 14, 7)
)

create_vertical_lollipop_chart <- function(data, category, ascending) {

  data <- if (ascending) {
    data %>% arrange(Count)
  } else {
    data %>% arrange(desc(Count))
  }
  
  ggplot(data, aes(x = Name, y = Count)) +
    geom_segment(aes(xend = Name, yend = 0), color = "black", size = 0.5) +
    geom_point(color = "black", size = 3) +
    geom_text(aes(label = Count, y = Count + max(1, 0.03 * max(Count))), vjust = 0) +
    labs(title = paste(category), x = NULL, y = "Numbers") +
    theme_minimal() +
    theme(panel.grid.major = element_line(size = 0.25, linetype = 'solid', colour = "#D3D3D3"),
          panel.grid.minor = element_blank(),
          panel.border = element_rect(colour = "#D3D3D3", fill=NA, size=0.5),
          plot.title = element_text(size = 12, face = "plain", hjust = 0.0, vjust = 0.5),
          axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
          axis.text.y = element_text(size = 10),
          axis.title.y = element_text(size = 10),
          axis.title.x = element_blank(),
          plot.margin = unit(c(1,1,1,1), "lines"))
}

p1 <- create_vertical_lollipop_chart(algorithms, "Algorithm Types", ascending = TRUE)
p2 <- create_vertical_lollipop_chart(metrics, "Output Metrics (Except for AUROC)", ascending = FALSE)

grid.arrange(p1, p2, ncol = 2)
