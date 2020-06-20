###### pregnant teens #######
library(tidyverse)

preg.teens <- readr::read_csv("C:\\Users\\User\\Desktop\\Amandla\\pregnant school children.csv")
preg.teens
View(preg.teens)

centraldata <- preg.teens[c(10,27,31,38,40,41),]%>% 
  rename(below15 = "Adolescent (10-14 years)", above15 = "(Adolescents 15-19 years)") %>% 
  pivot_longer(cols = c(below15, above15),
               names_to = "Pregnant.Teens",
               values_to = "Number.of.Pregnant.Teens")
centraldata  
View(centraldata)
colnames(centraldata)
ggplot2::ggplot(data = centraldata,
                mapping = aes(x = reorder(COUNTY, - Number.of.Pregnant.Teens), 
                              y = Number.of.Pregnant.Teens, fill = Pregnant.Teens))+
  geom_col(position = "dodge")+
  scale_y_continuous(labels = scales::comma_format(),
                     breaks = seq(0,5000, by = 500),
                     expand = c(0,1))+
  labs(title = " Distribution of Pregnant Teens in Central Region",
       subtitle = "PERIOD: JAN 2020 - MAY 2020",
       x = "County",
       caption = "Source: Twitter| graphics: @ngina_wangui")+
  scale_fill_manual(values = c("#c70039", "#f37121"),
                    labels = c("above15", "below15"))+
  theme(legend.position = "top",
        legend.title = element_blank(),
        legend.text = element_text(size = 10),
        legend.spacing.x = unit(0.2, "cm"),
        panel.grid.major.x = element_blank())
ggsave("preg.png")
