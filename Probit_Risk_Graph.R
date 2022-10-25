###Trying to make a graph similar to Figure 4 in DPR Criteria Expert Panel Preliminary Finding, Recommendations, and Comments
library(ggplot2)
library(ggpubr)
library(scales)

setwd("C:/Users/crankk/OneDrive - LVWATER - Las Vegas Valley Water District/NSF Homeless Footprint/Homeless QMRA")

df<-read.csv("Homelessness_LVW_contact_QMRA.csv")
df$bathing_rank<-(rank(df$Bathing)/length(df$Bathing)*100)
df$tooth_rank<-rank(df$Tooth.Brushing)/length(df$Tooth.Brushing)*100
df$mouth_rank<-rank(df$Mouth.Contact.following.Hand.Submersion)/length(df$Mouth.Contact.following.Hand.Submersion)*100

par(mfrow = c(1,1))
head(df)
plot(df$bathing_rank,df$Bathing,log="x")
p1 <- ggplot(df, aes(x = df$bathing_rank/100, y = df$Bathing)) +
  geom_line() +
  theme_bw()
p1
p2<-p1+scale_x_log10(labels=scales::label_percent())
p2 + annotation_logticks() +
  theme(panel.grid.minor = element_blank(),
        axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x = "Rank", y = "Probability", title = "Rank vs. Probability")
