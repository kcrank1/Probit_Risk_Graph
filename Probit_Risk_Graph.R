#Graphing probability of illness from Campylobacter through various contacts with the Las Vegas Wash
#Example file is "LVW_contact_QMRA.csv" and is included.
#KC 11/9/2022
#NOTE!!! Alternatively you can maually create the y axis column by using the stat_ecdf function on individual categories. Haven't tried yet

library(ggplot2)
library(scales)
library(reshape2)
library(viridis)
setwd("C:/Users/crankk/OneDrive - LVWATER - Las Vegas Valley Water District/NSF Homeless Footprint/Homeless QMRA")
df<-read.csv("LVW_contact_QMRA.csv")
head(df)


##single distribution
p<-ggplot(df,aes(x=Bathing),) +geom_point(aes(y=..y..),stat="ecdf") +
  scale_x_continuous(limits = c(0,1))+
  xlab("Probability of Illness")+
  scale_y_continuous(trans="probit",
                     breaks=c(0.0001, 0.001, 0.01, 0.05, 0.1, 0.2, 0.3, 0.5, 0.7, 0.8, 0.9, 0.95, 0.97, 0.99, 0.999, 0.9999),
                     labels=c("0.01", "0.1", "1", "5", "10", "20", "30", "50", "70", "80", "90", "95","97", "99", "99.9", "99.99")) +
  ylab(paste("Percent", "\u2264")) +theme_bw(base_size = 19,base_rect_size = 2)+
  coord_flip()
# library(plotly)
# 
# ggplotly(p)
# ##multiple distributions

p
#convert to tall/long format(from wide format)
df<-melt(df)

#head(df)
ggplot(df,aes(x=value,color=variable),) +geom_point(aes(y=..y..),stat="ecdf") +
  scale_x_continuous(limits = c(0,1))+
  xlab("Probability of Illness")+
  scale_y_continuous(trans="probit",
                     breaks=c(0.0001, 0.001, 0.01, 0.05, 0.1, 0.2, 0.3, 0.5, 0.7, 0.8, 0.9, 0.95, 0.99, 0.999, 0.9999),
                     labels=c("0.01", "0.1", "1", "5", "10", "20", "30", "50", "70", "80", "90", "95", "99", "99.9", "99.99")) +
  ylab(paste("Percent", "\u2264")) +theme_bw(base_size = 19,base_rect_size = 2)+
 # theme(legend.position = c(.72,.925),legend.background = element_rect(fill = "white"))+
  scale_colour_viridis_d(option = "plasma",name=NULL)+
  coord_flip()

