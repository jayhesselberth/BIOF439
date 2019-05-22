install.packages("tidyverse")
install.packages("ggplot2")
install.packages("ggrepel")
install.packages("ggpubr")


library(tidyverse)
library(ggplot2)
library(ggrepel)
library(dplyr)
library(ggpubr)
library(gridExtra)
library(cowplot)


View(GSE65621_table2_human_RPKM)

### Manipulate data frame

All_RPKM_plus1 <- GSE65621_table2_human_RPKM %>% 
  mutate(mRNA_HC1_nc_3d_693 = mRNA_HC1_nc_3d_693 + 1) %>% 
  mutate(mRNA_HC2_nc_3d_786 = mRNA_HC2_nc_3d_786 + 1) %>% 
  mutate(mRNA_HC3_nc_3d_789 = mRNA_HC3_nc_3d_789 + 1) %>% 
  mutate(mRNA_HC4_nc_3d_835 = mRNA_HC4_nc_3d_835 + 1) %>% 
  mutate(mRNA_HC1_IL6_3d_694 = mRNA_HC1_IL6_3d_694 + 1) %>% 
  mutate(mRNA_HC2_IL6_3d_787 = mRNA_HC2_IL6_3d_787 + 1) %>% 
  mutate(mRNA_HC3_IL6_3d_790 = mRNA_HC3_IL6_3d_790 + 1) %>% 
  mutate(mRNA_HC4_IL6_3d_836 = mRNA_HC4_IL6_3d_836 + 1) %>% 
  mutate(mRNA_HC1_IL27_3d_695 = mRNA_HC1_IL27_3d_695 + 1) %>% 
  mutate(mRNA_HC2_IL27_3d_788 = mRNA_HC2_IL27_3d_788 + 1) %>% 
  mutate(mRNA_HC3_IL27_3d_791 = mRNA_HC3_IL27_3d_791 + 1) %>% 
  mutate(mRNA_HC4_IL27_3d_837 = mRNA_HC4_IL27_3d_837 + 1) %>% 
  mutate(mRNA_S1GOF1_nc_3d_621 = mRNA_S1GOF1_nc_3d_621 + 1) %>% 
  mutate(mRNA_S1GOF2_nc_3d_795 = mRNA_S1GOF2_nc_3d_795 + 1) %>% 
  mutate(mRNA_S1GOF3_nc_3d_838 = mRNA_S1GOF3_nc_3d_838 + 1) %>% 
  mutate(mRNA_S1GOF4_nc_3d_841 = mRNA_S1GOF4_nc_3d_841 + 1) %>%
  mutate(mRNA_S1GOF5_nc_3d_844 = mRNA_S1GOF5_nc_3d_844 + 1) %>%
  mutate(mRNA_S1GOF1_IL6_3d_622 = mRNA_S1GOF1_IL6_3d_622 + 1) %>% 
  mutate(mRNA_S1GOF2_IL6_3d_796 = mRNA_S1GOF2_IL6_3d_796 + 1) %>% 
  mutate(mRNA_S1GOF3_IL6_3d_839 = mRNA_S1GOF3_IL6_3d_839 + 1) %>% 
  mutate(mRNA_S1GOF4_IL6_3d_842 = mRNA_S1GOF4_IL6_3d_842 + 1) %>%
  mutate(mRNA_S1GOF5_IL6_3d_845 = mRNA_S1GOF5_IL6_3d_845 + 1) %>%
  mutate(mRNA_S1GOF1_IL27_3d_623 = mRNA_S1GOF1_IL27_3d_623 + 1) %>% 
  mutate(mRNA_S1GOF2_IL27_3d_797 = mRNA_S1GOF2_IL27_3d_797 + 1) %>% 
  mutate(mRNA_S1GOF3_IL27_3d_840 = mRNA_S1GOF3_IL27_3d_840 + 1) %>% 
  mutate(mRNA_S1GOF4_IL27_3d_843 = mRNA_S1GOF4_IL27_3d_843 + 1) %>%
  mutate(mRNA_S1GOF5_IL27_3d_846 = mRNA_S1GOF5_IL27_3d_846 + 1)


IL6vNC <- All_RPKM_plus1 %>% 
  mutate(HC1_IL6vNC = mRNA_HC1_IL6_3d_694 / mRNA_HC1_nc_3d_693,
         HC2_IL6vNC = mRNA_HC2_IL6_3d_787 / mRNA_HC2_nc_3d_786,
         HC3_IL6vNC = mRNA_HC3_IL6_3d_790 / mRNA_HC3_nc_3d_789,
         HC4_IL6vNC = mRNA_HC4_IL6_3d_836 / mRNA_HC4_nc_3d_835,
         S1gof1_IL6vNC = mRNA_S1GOF1_IL6_3d_622 / mRNA_S1GOF1_nc_3d_621,
         S1gof2_IL6vNC = mRNA_S1GOF2_IL6_3d_796 / mRNA_S1GOF2_nc_3d_795,
         S1gof3_IL6vNC = mRNA_S1GOF3_IL6_3d_839 / mRNA_S1GOF3_nc_3d_838,
         S1gof4_IL6vNC = mRNA_S1GOF4_IL6_3d_842 / mRNA_S1GOF4_nc_3d_841,
         S1gof5_IL6vNC = mRNA_S1GOF5_IL6_3d_845 / mRNA_S1GOF5_nc_3d_844) %>% 
  select(-1, -3:-29)

IL27vNC <- All_RPKM_plus1 %>% 
  mutate(HC1_IL27vNC = mRNA_HC1_IL27_3d_695 / mRNA_HC1_nc_3d_693,
         HC2_IL27vNC = mRNA_HC2_IL27_3d_788 / mRNA_HC2_nc_3d_786,
         HC3_IL27vNC = mRNA_HC3_IL27_3d_791 / mRNA_HC3_nc_3d_789,
         HC4_IL27vNC = mRNA_HC4_IL27_3d_837 / mRNA_HC4_nc_3d_835,
         S1gof1_IL27vNC = mRNA_S1GOF1_IL27_3d_623 / mRNA_S1GOF1_nc_3d_621,
         S1gof2_IL27vNC = mRNA_S1GOF2_IL27_3d_797 / mRNA_S1GOF2_nc_3d_795,
         S1gof3_IL27vNC = mRNA_S1GOF3_IL27_3d_840 / mRNA_S1GOF3_nc_3d_838,
         S1gof4_IL27vNC = mRNA_S1GOF4_IL27_3d_843 / mRNA_S1GOF4_nc_3d_841,
         S1gof5_IL27vNC = mRNA_S1GOF5_IL27_3d_846 / mRNA_S1GOF5_nc_3d_844) %>% 
  select(-1, -3:-29)

DF_IL6vNC <- IL6vNC %>% 
  mutate(HC_IL6vNC_means = rowMeans(.[,2:5])) %>% 
  mutate(S1gof_IL6vNC_means = rowMeans(.[,6:10]))

DF_IL6vNC <- DF_IL6vNC %>%
  mutate(S1gofFC_larger = S1gof_IL6vNC_means / HC_IL6vNC_means) 

DF_IL6vNC <- DF_IL6vNC %>%
  mutate(group = case_when(
    S1gofFC_larger >= 1.5 ~ 1,
    S1gofFC_larger < 1.5 & S1gofFC_larger > 0.667 ~ 2,
    S1gofFC_larger <= 0.667 ~ 3))

DF_IL27vNC <- IL27vNC %>% 
  mutate(HC_IL27vNC_means = rowMeans(.[,2:5])) %>% 
  mutate(S1gof_IL27vNC_means = rowMeans(.[,6:10])) 


# plots for IL-6

pointsToLabel <- c("GZMB", "ADM", "GNA15", "NKG7", "CCL4", "CXCL10", "TBX21",
                   "DDIT4", "NRN1", "CSF2", "CCR4", "NPW")

plot_IL6 <- ggplot(data = DF_IL6vNC, aes(x = log2(HC_IL6vNC_means), y = log2(S1gof_IL6vNC_means))) +
  geom_point(color = "coral") +
  geom_smooth(color = "coral4") +
  theme_bw() +
  xlab("Healthy Control (log2FC)") +
  ylab("STAT1-GOF Patient (log2FC)") +
  ggtitle("IL-6 vs No Cytokine") +
  theme(plot.title = element_text(color = "coral4", vjust = 0.2)) +
  geom_text_repel(aes(label = Gene_symbol),
                  size = 4,
                  force = 50,
                  box.padding = unit(0.5, "lines"),
                  point.padding = unit(0.5, "lines"),
                  arrow = arrow(length = unit(0.015, "npc")),
                  color = "gray20",
                  data = DF_IL6vNC %>% 
                    filter(Gene_symbol %in% pointsToLabel)) +
  xlim(-3, 4) + ylim(-5, 6)


# plots for IL-27

plot_IL27 <- ggplot(data = DF_IL27vNC, aes(x = log2(HC_IL27vNC_means), y = log2(S1gof_IL27vNC_means))) +
  geom_point(color = "cornflowerblue") +
  geom_smooth() +
  theme_bw() +
  xlab("Healthy Control (log2FC)") +
  ylab("STAT1-GOF Patient (log2FC)") +
  ggtitle("IL-27 vs No Cytokine") +
  theme(plot.title = element_text(color = "#3366FF", vjust = 0.2)) +
  geom_text_repel(aes(label = Gene_symbol),
                  size = 4,
                  force = 50,
                  box.padding = unit(0.5, "lines"),
                  point.padding = unit(0.5, "lines"),
                  arrow = arrow(length = unit(0.015, "npc")),
                  color = "gray20",
                  data = DF_IL27vNC %>% 
                    filter(Gene_symbol %in% pointsToLabel)) +
  xlim(-3, 4) + ylim(-5, 6)


# plot multiple panels

MyFigure <- ggarrange (plot_IL27, plot_IL6,
                       ncol = 2, nrow = 1)

annotate_figure(MyFigure, 
                top = text_grob("Effect of STAT1 gain-of-function (GOF) mutation on gene expression",
                                size = 14, face = "bold"))
