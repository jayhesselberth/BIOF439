install.packages(c("ggplot2", "readxl", "tidyverse"))


library(readxl)
EchoC_data <- read_excel("/cloud/project/Pfeifer Echo Edit for R.xlsx", sheet = "Echo_for_R")
names(EchoC_data)
head(EchoC_data)
#install.packages("tidyverse")
library(tidyverse)


install.packages("plotly")
install.packages("ggrepel")

#library(ggrepel)

#apply(EchoC_data, 2, function(x) sum(is.na(x)))
library(tidyverse)

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




library(ggplot2)
#New versions 

LV_Sys_Vol <- ggplot(EchoC_data, aes(x = Genotype, y = LV_Vol_s, fill = Group, label = ID)) + 
  geom_violin(scale = "area", adjust = 1) + 
  scale_fill_manual(values=c("#999999", "#D4AF37", "#56B4E9")) +
  geom_point(position=position_dodge(width = .9), aes(group = Group), size = .5, height = 0, width = 0.05, show.legend = FALSE) + #can use geom_jitter to introduce a small amount of random variation to the location of each point to handle overplott
  ylab("Left Ventricular Systolic Volume (μL)") + 
  scale_x_discrete(limits = c("Wild_Type", "Mutant")) + 
  ggtitle("Systolic Volume Variation") + 
  stat_summary(fun.y = mean, geom = "point", shape = 18, size  = 3, color = "red", position = position_dodge(width = 0.9), show.legend = FALSE) + 
  stat_summary(fun.y = median,  geom = "point", shape = 3, size = 3, color = "blue", position = position_dodge(width = 0.9), show.legend = FALSE) +
  jn_theme()
  
LV_Sys_Vol


install.packages('dplyr', repos = 'https://cloud.r-project.org')

library(dplyr)
#Messing around:
library(plotly)
ggplotly(LV_Sys_Vol, tooltip = c("ID", "LV_Vol_s"))

#geom_label_repel(aes(label = ID),
#box.padding   = 0.35, 
#point.padding = 0.5,
#segment.color = 'grey50') +

#Good Graphics:
#EF
LV_EF <- ggplot(EchoC_data, aes(x = Genotype, y = EF, fill = Group)) + 
  geom_violin(scale = "area", adjust = 1) + 
  scale_fill_manual(values=c("#999999", "#D4AF37", "#56B4E9")) +
  theme_bw() + 
  geom_point(position=position_dodge(width = 0.9), aes(group = Group), size = .5, height = 0, width = 0.05, show.legend = FALSE) + #can use geom_jitter to introduce a small amount of random variation to the location of each point to handle overplott
  ylab("Ejection Fraction %") + 
  scale_x_discrete(limits = c("Wild_Type", "Mutant")) + 
  ggtitle("Ejection Fraction Variation") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y = mean, geom="point", shape = 18, size  = 3, color = "red", position = position_dodge(width = 0.9), show.legend = FALSE) + 
  stat_summary(fun.y=median,  geom = "point", shape = 3, size = 3, color = "blue", position = position_dodge(width = 0.9), show.legend = FALSE) 
LV_EF


LVOT_Mean_grad <- ggplot(EchoC_data, aes(x = Genotype, y = LVOT_mean_grad, fill = Group)) + 
  geom_violin(scale = "area", adjust = 1) + 
  scale_fill_manual(values=c("#999999", "#D4AF37", "#56B4E9")) +
  theme_bw() + 
  geom_point(position=position_dodge(width = 0.9), aes(group = Group), size = .5, height = 0, width = 0.05, show.legend = FALSE) + 
  ylab("Left Ventricular Outflow Tract Mean Gradient") + #UNITS???
  scale_x_discrete(limits = c("Wild_Type", "Mutant")) + 
  ggtitle("Left Ventricular Outflow Tract Mean Gradient Variation") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y = mean, geom="point", shape = 18, size  = 3, color = "red", position = position_dodge(width = 0.9), show.legend = FALSE) + 
  stat_summary(fun.y=median,  geom = "point", shape = 3, size = 3, color = "blue", position = position_dodge(width = 0.9), show.legend = FALSE) 
LVOT_Mean_grad


Aorta_sys <- ggplot(EchoC_data, aes(x = Genotype, y = Aor_sys, fill = Group)) + 
  geom_violin(scale = "area", adjust = 1) + 
  scale_fill_manual(values=c("#999999", "#D4AF37", "#56B4E9")) +
  theme_bw() + 
  geom_point(position=position_dodge(width = 0.9), aes(group = Group), size = .5, height = 0, width = 0.05, show.legend = FALSE) + 
  ylab("Aorta Diameter (mm)") + #UNITS???
  scale_x_discrete(limits = c("Wild_Type", "Mutant")) + 
  ggtitle("Variations in Aortic Diameter in Systole") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y = mean, geom="point", shape = 18, size  = 3, color = "red", position = position_dodge(width = 0.9), show.legend = FALSE) + 
  stat_summary(fun.y=median,  geom = "point", shape = 3, size = 3, color = "blue", position = position_dodge(width = 0.9), show.legend = FALSE) 
Aorta_sys






#Single time point graph

LV_Sys_Vol_15 <- ggplot(data = EchoC_data[EchoC_data$Group == "September",], aes(x = Genotype, y = LV_Vol_s)) + 
  geom_violin(scale = "area", adjust = 1, aes(color = Genotype), show.legend = FALSE) + 
  scale_color_manual(values = c("Wild_Type"="Black", "Mutant"="Red")) +
  geom_point(size = 0.5, height = 0, width = 0.05) + #can use geom_jitter to introduce a small amount of random variation to the location of each point to handle overplott
  ylab("Left Ventricular Systolic Volume (uL)") + 
  scale_x_discrete(limits = c("Wild_Type", "Mutant")) + 
  stat_summary(fun.y = mean, geom = "point", shape = 5, size  = 3, color = "#9A2617") + 
  stat_summary(fun.y = median,  geom = "point", shape = 3, size = 3, color = "blue") +
  jn_theme() +
  theme(axis.title.x = element_blank())
LV_Sys_Vol_15

#Dont need this for poster
LV_Diam_systole_15 <- ggplot(data = EchoC_data[EchoC_data$Group == "September",], aes(x = Genotype, y = Dia_s)) + 
  geom_violin(scale = "area", adjust = 1, aes(color = Genotype), show.legend = FALSE) + 
  scale_color_manual(values = c("Wild_Type"="Black", "Mutant"="Red")) +
  geom_point(size = 0.5, height = 0, width = 0.05) + #can use geom_jitter to introduce a small amount of random variation to the location of each point to handle overplott
  ylab("Left Ventricular Diameter (mm)") + 
  scale_x_discrete(limits = c("Wild_Type", "Mutant")) + 
  stat_summary(fun.y = mean, geom = "point", shape = 5, size  = 3, color = "#9A2617") + 
  stat_summary(fun.y = median,  geom = "point", shape = 3, size = 3, color = "blue") +
  jn_theme() +
  theme(axis.title.x = element_blank())
LV_Diam_systole_15


LVAW_dia_15 <- ggplot(data = EchoC_data[EchoC_data$Group == "September",], aes(x = Genotype, y = LVAW_d)) + 
  geom_violin(scale = "area", adjust = 1, aes(color = Genotype), show.legend = FALSE) + 
  scale_color_manual(values = c("Wild_Type"="Black", "Mutant"="Red")) +
  geom_point(size = 0.5, height = 0, width = 0.05) + #can use geom_jitter to introduce a small amount of random variation to the location of each point to handle overplott
  ylab("Left Ventricular Anterior Wall Diameter (mm)") + 
  scale_x_discrete(limits = c("Wild_Type", "Mutant")) + 
  stat_summary(fun.y = mean, geom = "point", shape = 5, size  = 3, color = "#9A2617") + 
  stat_summary(fun.y = median,  geom = "point", shape = 3, size = 3, color = "blue") +
  jn_theme() +
  theme(axis.title.x = element_blank())
LVAW_dia_15

Ejection_fraction_15 <- ggplot(data = EchoC_data[EchoC_data$Group == "September",], aes(x = Genotype, y = EF)) + 
  geom_violin(scale = "area", adjust = 1, aes(color = Genotype), show.legend = FALSE) + 
  scale_color_manual(values = c("Wild_Type"="Black", "Mutant"="Red")) +
  geom_point(size = 0.5, height = 0, width = 0.05) + #can use geom_jitter to introduce a small amount of random variation to the location of each point to handle overplott
  ylab("Ejection Fraction (%)") + 
  scale_x_discrete(limits = c("Wild_Type", "Mutant")) + 
  stat_summary(fun.y = mean, geom = "point", shape = 5, size  = 3, color = "#9A2617") + 
  stat_summary(fun.y = median,  geom = "point", shape = 3, size = 3, color = "blue") +
  jn_theme() +
  theme(axis.title.x = element_blank())
Ejection_fraction_15


LVOT_Mean_grad_15 <- ggplot(data = EchoC_data[EchoC_data$Group == "September",], aes(x = Genotype, y = LVOT_mean_grad)) + 
  geom_violin(scale = "area", adjust = 1, aes(color = Genotype), show.legend = FALSE) + 
  scale_color_manual(values = c("Wild_Type"="Black", "Mutant"="Red")) +
  geom_point(size = 0.5, height = 0, width = 0.05) + #can use geom_jitter to introduce a small amount of random variation to the location of each point to handle overplott
  ylab("Mean Gradient (mmHg)") + 
  scale_x_discrete(limits = c("Wild_Type", "Mutant")) + 
  stat_summary(fun.y = mean, geom = "point", shape = 5, size  = 3, color = "#9A2617") + 
  stat_summary(fun.y = median,  geom = "point", shape = 3, size = 3, color = "blue") +
  jn_theme() +
  theme(axis.title.x = element_blank())
LVOT_Mean_grad_15

Aorta_sys_15<- ggplot(data = EchoC_data[EchoC_data$Group == "September",], aes(x = Genotype, y = Aor_sys)) + 
  geom_violin(scale = "area", adjust = 1, aes(color = Genotype), show.legend = FALSE) + 
  scale_color_manual(values = c("Wild_Type"="Black", "Mutant"="Red")) +
  geom_point(size = 0.5, height = 0, width = 0.05) + #can use geom_jitter to introduce a small amount of random variation to the location of each point to handle overplott
  ylab("Aorta Diameter (mm)") + 
  scale_x_discrete(limits = c("Wild_Type", "Mutant")) + 
  stat_summary(fun.y = mean, geom = "point", shape = 5, size  = 3, color = "#9A2617") + 
  stat_summary(fun.y = median,  geom = "point", shape = 3, size = 3, color = "blue") +
  jn_theme() +
  theme(axis.title.x = element_blank())
Aorta_sys_15













































### Code for all other graphics to be edited:

#LV Diam Sys
LV_Diam_Sys <- ggplot(EchoC_data, aes(x = Genotype, y = Dia_s, fill = Group)) + 
  geom_violin(scale = "area", adjust = 1) + 
  scale_fill_manual(values=c("#999999", "#D4AF37", "#56B4E9")) +
  theme_bw() + 
  geom_point(position=position_dodge(width = 0.9), aes(group = Group), size = .5, height = 0, width = 0.05, show.legend = FALSE) + #can use geom_jitter to introduce a small amount of random variation to the location of each point to handle overplott
  ylab("Left Ventricular Diameter (mm)") + 
  scale_x_discrete(label = c("Wild Type", "Mutant")) + 
  ggtitle("Left Ventricular Diameter Variation in Systole") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y = mean, geom="point", shape = 18, size  = 3, color = "red", position = position_dodge(width = 0.9), show.legend = FALSE) + 
  stat_summary(fun.y=median,  geom = "point", shape = 3, size = 3, color = "blue", position = position_dodge(width = 0.9), show.legend = FALSE) 
LV_Diam_Sys



#LVAW Dia
LVAW_Dia <- ggplot(EchoC_data, aes(x = Genotype, y = LVAW_d, fill = Group)) + 
  geom_violin(scale = "area", adjust = 1) + 
  scale_fill_manual(values=c("#999999", "#D4AF37", "#56B4E9")) +
  theme_bw() + 
  geom_point(position=position_dodge(width = 0.9), aes(group = Group), size = .5, height = 0, width = 0.05, show.legend = FALSE) + 
  ylab("Left Ventricle Anterior Wall Thickness (mm)") + 
  scale_x_discrete(label = c("Wild Type", "Mutant")) + 
  ggtitle("Left Ventricular Wall Thickness in Diastole") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y = mean, geom="point", shape = 18, size  = 3, color = "red", position = position_dodge(width = 0.9), show.legend = FALSE) + 
  stat_summary(fun.y=median,  geom = "point", shape = 3, size = 3, color = "blue", position = position_dodge(width = 0.9), show.legend = FALSE) 
LVAW_Dia


#LVOT Mean Gradient
LVOT_Mean_grad <- ggplot(EchoC_data, aes(x = Genotype, y = LVOT_mean_grad, fill = Group)) + 
  geom_violin(scale = "area", adjust = 1) + 
  scale_fill_manual(values=c("#999999", "#D4AF37", "#56B4E9")) +
  theme_bw() + 
  geom_point(position=position_dodge(width = 0.9), aes(group = Group), size = .5, height = 0, width = 0.05, show.legend = FALSE) + 
  ylab("Left Ventricular Outflow Tract Mean Gradient") + #UNITS???
  scale_x_discrete(label = c("Wild Type", "Mutant")) + 
  ggtitle("Left Ventricular Outflow Tract Mean Gradient Variation") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y = mean, geom="point", shape = 18, size  = 3, color = "red", position = position_dodge(width = 0.9), show.legend = FALSE) + 
  stat_summary(fun.y=median,  geom = "point", shape = 3, size = 3, color = "blue", position = position_dodge(width = 0.9), show.legend = FALSE) 
LVOT_Mean_grad


#LVOT Peak Grad
LVOT_Peak_grad <- ggplot(EchoC_data, aes(x = Genotype, y = LVOT_Peak_grad, fill = Group)) + 
  geom_violin(scale = "area", adjust = 1) + 
  theme_bw() + 
  geom_point(size = .5, height = 0, width = 0.05) + 
  ylab("Left Ventricular Outflow Tract Peak Gradient") + 
  scale_x_discrete(label = c("Wild Type", "Mutant")) + 
  ggtitle("June 2018 Left Ventricular Outflow Tract Peak Gradient Variation") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y = mean, geom="point", shape = 18, size  = 3, color = "red") + 
  stat_summary(fun.y=median,  geom = "point", shape = 3, size = 3, color = "blue") 
LVOT_Peak_grad




#LVOT Mean Vel
LVOT_Mean_Vel <- ggplot(EchoC_data, aes(x = Genotype, y = mean_vel)) + geom_violin(scale = "area", adjust = 1) + theme_bw() + 
  geom_point(size = .5, height = 0, width = 0.05) + 
  ylab("Left Ventricular Outflow Tract Mean Velocity") + 
  scale_x_discrete(label = c("Wild Type", "Mutant")) + 
  ggtitle("June 2018 Left Ventricular Outflow Tract Mean Velocity Variation") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y = mean, geom="point", shape = 18, size  = 3, color = "red") + 
  stat_summary(fun.y=median,  geom = "point", shape = 3, size = 3, color = "blue") 
LVOT_Mean_Vel




#LVOT  Peak Vel
LVOT_Peak_Vel <- ggplot(EchoC_data, aes(x = Genotype, y = Peak_vel)) + geom_violin(scale = "area", adjust = 1) + theme_bw() + 
  geom_point(size = .5, height = 0, width = 0.05) + 
  ylab("Left Ventricular Outflow Tract Peak Velocity") + 
  scale_x_discrete(label = c("Wild Type", "Mutant")) + 
  ggtitle("June 2018 Left Ventricular Outflow Tract Peak Velocity Variation") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y = mean, geom="point", shape = 18, size  = 3, color = "red") + 
  stat_summary(fun.y=median,  geom = "point", shape = 3, size = 3, color = "blue") 
LVOT_Peak_Vel



#Aorta in Sys
Aor_systole <- ggplot(EchoC_data, aes(x = Genotype, y = Aor_sys)) + geom_violin(scale = "area", adjust = 1) + theme_bw() + 
  geom_point(size = .5, height = 0, width = 0.05) + 
  ylab("Aorta Diameter (mm)") + 
  scale_x_discrete(label = c("Wild Type", "Mutant")) + 
  ggtitle("June 2018 Aorta Internal Diameter Systolic Variation") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y = mean, geom="point", shape = 18, size  = 3, color = "red") + 
  stat_summary(fun.y=median,  geom = "point", shape = 3, size = 3, color = "blue") 
Aor_systole



#Brachiocephalic trunk
brachiocephalic_trunk <- ggplot(EchoC_data, aes(x = Genotype, y = brach.)) + geom_violin(scale = "area", adjust = 1) + theme_bw() + 
  geom_point(size = .5, height = 0, width = 0.05) + 
  ylab("Brachiocephalic Trunk Diameter (mm)") + 
  scale_x_discrete(label = c("Wild Type", "Mutant")) + 
  ggtitle("June 2018 Brachiocephalic Trunk Diameter Variation") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y = mean, geom="point", shape = 18, size  = 3, color = "red") + 
  stat_summary(fun.y=median,  geom = "point", shape = 3, size = 3, color = "blue") 
brachiocephalic_trunk



#PWV is only for Sept
PWV_Sept <- ggplot(new_echo_r, aes(x = Genotype, y = PWV)) + geom_violin(scale = "area", adjust = .6) + theme_bw() + 
  geom_jitter(size = .5, height = 0, width = 0.05) + 
  ylab("PWV") + 
  scale_x_discrete(limits = c("Wild_Type", "Mutant"), label = c("Wild Type", "Mutant")) +
  ggtitle("September 2018 PWV") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y = mean, geom="point", shape = 18, size  = 3, color = "red") + 
  stat_summary(fun.y = median,  geom = "point", shape = 3, size = 3, color = "blue")
PWV_Sept
summary(PWV_Sept)


#Make the points interactive with the IDs able to be scrolled over/dots with IDs next to them?


