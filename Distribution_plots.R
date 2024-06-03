library(ggplot2)
library(gridExtra)
library(stringr)

country_data <- data.frame(
  Country = c("United States", "China", "South Korea", "Others"),
  Number = c(13, 3, 3, 7)
)

study_design_data <- data.frame(
  Study_Design = c("Retrospective Study", "Prospective Study", "Randomised Controlled Trial"),
  Number = c(21, 4, 1)
)

demographic_data <- data.frame(
  Demographic = c("Adult patients", "Paediatric patients", "Patients of all ages"),
  Number = c(18, 3, 5)
)

sepsis_definition_data <- data.frame(
  Sepsis_Definition = c("Sepsis-3", "ICD-10", "ICD-9", "Infection", "Others"),
  Number = c(12, 5, 3, 3, 6)
)

fill_color <- "skyblue"

create_plot <- function(data, x, y, title, fill_color) {
  ggplot(data, aes_string(x = x, y = y)) +
    geom_bar(stat = "identity", fill = fill_color, width = 0.5) +
    geom_text(aes_string(label = y), vjust = -0.5) +
    theme_minimal() +
    labs(title = title, y = "Number") +
    theme(
      plot.title = element_text(size = 10, hjust = 0.5),
      axis.text.x = element_text(angle = 0, hjust = 0.5, vjust = 1),
      axis.title.x = element_blank(),
      plot.margin = margin(t = 20, r = 20, b = 20, l = 20)
    ) +
    scale_x_discrete(labels = function(x) str_wrap(x, width = 10)) +
    scale_y_continuous(expand = c(0, 0), limits = c(0, ceiling(max(data[[y]]) / 5) * 5), breaks = seq(0, ceiling(max(data[[y]]) / 5) * 5, by = 5))
}

p1 <- create_plot(country_data, "Country", "Number", "Country Distribution", fill_color)
p2 <- create_plot(study_design_data, "Study_Design", "Number", "Study Design", fill_color)
p3 <- create_plot(demographic_data, "Demographic", "Number", "Research Demographic", fill_color)
p4 <- create_plot(sepsis_definition_data, "Sepsis_Definition", "Number", "Sepsis Definition", fill_color)

grid.arrange(p1, p2, p3, p4, ncol = 2)