# WORKINGS FOR DIGITAL CV


# LIBRARIES ---------------------------------------------------------------
library(tibble)
library(ggplot2)
library(viridis)
library(magrittr)


# SKILLS & TECHNOLOGIES ---------------------------------------------------
# Create dataframe
df <- tribble(
  ~ Skill, ~ `Proficiency (1-5)`, ~ Class,
  "R", 5, "Language",
  "R Shiny", 5, "Web Framework",
  "Git", 4, "Tools",
  "RStudio", 5, "Tools",
  "VSCode", 4, "Tools",
  "Docker", 3, "DevOps",
  "Python", 2, "Language",
  "SQL", 3, "Language",
  "HTML", 4, "Language",
  "CSS", 4, "Language",
  "Azure", 3, "DevOps"
  
)

# Create plot
plt <- df %>%
  ggplot(aes(x = reorder(Skill, `Proficiency (1-5)`), y = `Proficiency (1-5)`, fill = as.factor(Class))) +
  geom_col() +
  geom_text(aes(label=`Proficiency (1-5)`), hjust=1.5, color="white", size=3.5) +
  coord_flip() +
  scale_fill_manual(values = c("#193cbc", "#1473af", "#589acf", "#89c3ef")) +
  labs(title = "Skills & Technologies", subtitle = "Proficiency on a scale of 1 to 5", caption = "Plot produced with R & ggplot2") +
  xlab("Skill") +
  # ylab("Proficiency (1=Beginner to 5=Expert)") +
  guides(fill=guide_legend(title="Class")) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        axis.title = element_blank()
        )

plt

ggsave("./images/skillsPlot.png", plot = plt, units = "px", width = 2000, height = 1000)
