library(ggplot2)

data <- data.frame(
  Feature = c("Respiratory Rate", "Temperature", "Systolic Blood Pressure (SBP)", "Age", 
              "Heart Rate (HR)", "Gender", "Diastolic Blood Pressure (DBP)", 
              "Oxygen Saturation (SpO2)", "White Blood Cell Count (WBC)", "Creatinine", 
              "Bilirubin", "Platelet", "Lactate", "Blood Urea Nitrogen", "Glucose", "Hemoglobin"),
  Count = c(22, 22, 22, 22, 17, 17, 14, 12, 11, 11, 9, 9, 8, 8, 7, 6)
)

ggplot(data, aes(x = reorder(Feature, Count), y = Count, fill = Count)) + 
  geom_bar(stat = "identity") + 
  coord_flip() +
  geom_text(aes(label = Count), position = position_dodge(width = 0.9), hjust = -0.1) +
  scale_fill_gradient(low = "turquoise", high = "steelblue") +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 25), breaks = seq(0, 25, 5)) +
  theme_minimal() +
  theme(
    panel.grid.major.y = element_line(color = "grey", linetype = "solid", size = 0.5),
    panel.grid.minor.y = element_blank(),
    panel.background = element_rect(fill = "white", colour = "black"),
    axis.ticks = element_blank(),
    axis.text.x = element_text(angle = 0, hjust = 1),
    plot.title = element_text(hjust = 0.5, size = 12)
  ) +
  labs(x = "Feature", y = "Count", title = "Feature Count for Sepsis Prediction Models")

