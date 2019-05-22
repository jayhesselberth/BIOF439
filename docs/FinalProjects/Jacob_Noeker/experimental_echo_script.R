
install.packages('flexdashboard')






library(readxl)
EchoC_data <- read_excel("~/Documents/Jacob/R/Data for R/Pfeifer Echo Edit for R.xlsx", sheet = "Echo_for_R")
names(EchoC_data)
head(EchoC_data)
#install.packages("tidyverse")
library(tidyverse)

#install.packages("forcats")

#EchoC_data <- EchoC_data %>% 
#mutate(EchoC_data$Genotype = forcats::fct_relevel(EchoC_data$Genotype, 'Wild_Type'))
#The above command is to align the wild type data before the mutant for the graphs but I fixed the problem using the scale_x_descrete command




#install.packages("plotly")
#install.packages("ggrepel")

#library(ggrepel)

#apply(EchoC_data, 2, function(x) sum(is.na(x)))
library(tidyverse)
#fixed_new_echo <- new_echo_r %>% drop_na()
#anyNA(fixed_new_echo)
#ttest <- t.test(PWV ~ Genotype, data=EchoC_data)
#ttest$p.value
#lapply(EchoC_data[,3:23], function(x) t.test(x ~ EchoC_data$Group, var.equal = TRUE)) #figure out genotype


jn_theme <- function(){
  theme_bw() +
    theme(axis.text = element_text(size = 14, color = "Black"),
          axis.title = element_text(size = 16),
          panel.grid.minor = element_blank(),
          strip.text = element_text(size=14),
          strip.background = element_blank(),
          plot.title = element_text(size = 20, hjust = 0.5),
          panel.grid.major.x = element_blank())
}



#library(plotly)

library(ggplot2)


LV_Sys_Vol_Sept <- ggplot(EchoC_data, aes(x = Genotype, y = LV_Vol_s)) + geom_violin() + theme_bw() + 
  ylab("Left Ventricular Systolic Volume (uL)") + 
  scale_x_discrete(limits = c("Wild_Type", "Mutant"), label = c("Wild Type", "Mutant")) +
  ggtitle("September 2018 Systolic Volume Variation") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y = mean, geom="point", shape = 18, size  = 3) + 
  stat_summary(fun.y = median,  geom = "point", shape = 3, size = 3, color = "blue")
LV_Sys_Vol_Sept

LV_Diameter_Sept <- ggplot(EchoC_data, aes(x = Genotype, y = Dia_s)) + geom_violin() + theme_bw() + 
  ylab("Left Ventricular Diameter (mm)") + 
  scale_x_discrete(limits = c("Wild_Type", "Mutant"), label = c("Wild Type", "Mutant")) +
  ggtitle("September 2018 Diameter Variation During Systole") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y = mean, geom="point", shape = 18, size  = 3) + 
  stat_summary(fun.y = median,  geom = "point", shape = 3, size = 3, color = "blue")
LV_Diameter_Sept


#New versions 

LV_Sys_Vol <- ggplot(EchoC_data, aes(x = Genotype, y = LV_Vol_s, fill = Group, label = ID)) + 
  geom_violin(position = "dodge") + 
  scale_fill_manual(values=c("#999999", "#D4AF37", "#56B4E9")) +
  geom_point(position=position_dodge(width = .9), aes(group = Group), size = .5, height = 0, width = 0.05, show.legend = FALSE) + #can use geom_jitter to introduce a small amount of random variation to the location of each point to handle overplott
  ylab("Left Ventricular Systolic Volume (μL)") + 
  scale_x_discrete(limits = c("Wild_Type", "Mutant")) + 
  ggtitle("Systolic Volume Variation") + 
  stat_summary(fun.y = mean, geom = "point", shape = 18, size  = 3, color = "red", position = position_dodge(width = 0.9), show.legend = FALSE) + 
  stat_summary(fun.y = median,  geom = "point", shape = 3, size = 3, color = "blue", position = position_dodge(width = 0.9), show.legend = FALSE) +
  jn_theme()

LV_Sys_Vol




#Messing around:
library(plotly)
ggplotly(LV_Sys_Vol, tooltip = c("ID", "LV_Vol_s"), barmode = "relative", position_dodge2())
#geom_label_repel(aes(label = ID),
#box.padding   = 0.35, 
#point.padding = 0.5,
#segment.color = 'grey50') +