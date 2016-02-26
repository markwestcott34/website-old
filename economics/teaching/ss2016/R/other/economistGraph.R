library(ggplot2)
library(dplyr)
library(readr)
library(ggrepel)

economist <- read_csv("http://www.markw.de/economics/teaching/ss2016/R/other/EconomistData.csv")

desired_labels <-
  c( "Congo",
     "Afghanistan",
     "Sudan",
     "Myanmar",
     "Botswana",
     "Japan",
     "Singapore",
     "New Zealand",
     "Norway",
     "Germany",
     "Spain",
     "France")

economist$label_country <- ifelse(economist$Country %in% desired_labels, TRUE, FALSE)

ggplot(data = economist, aes(x = CPI, y = HDI)) +
  geom_point(shape=1,aes(color=Region),size=2) + 
  geom_smooth(formula = y ~ poly(x, 2), method='lm',se=FALSE,color='red') +
  geom_text_repel(  aes(label = Country),subset(economist, label_country == TRUE),size=3.5) +
  scale_x_continuous(limits = c(1,10), breaks=1:10) +
  scale_y_continuous(limits = c(0.2,1), breaks=seq(from=0.2,to=1,by=0.1)) +
  xlab("Corruption Perceptions Index") + 
  ylab("Human Development Index") + 
  ggtitle("Corruption and Human Development") +
  guides(col = guide_legend(nrow = 1)) + 
  scale_colour_brewer(palette = "BrBG") +
  theme(axis.title.x = element_text(face="italic",margin=margin(15,0,0,0)),
        axis.title.y = element_text(face="italic",margin=margin(0,15,0,0)),
        plot.title = element_text(face="bold",hjust = 0),
        panel.grid.major = element_line(colour = "grey20"),
        panel.grid.major.x = element_blank(),
        panel.background=element_rect(fill = "white"),
        legend.position="top",
        legend.title=element_blank(),
        legend.key = element_blank(),
        legend.justification = c(0, 1))
