## load packages
library('ggplot2')
library('mgcv')

season <-read.csv('bp-seasonal-gam-data.csv')

#Subset annual data by season
Spring <- subset(season, Season==2)
Summer <- subset(season, Season==3)
Fall <- subset(season,Season==4)
Nowinter <- subset(season, Season>1)
Winter <- subset(season, Season==1)


#####Seasonal GAMs for averaged data
#First want to subset all data to post 1982 as not all variables were measured prior to 1982.
Spring83 <-subset(Spring, Year>1982)
Summer83 <-subset(Summer, Year>1982)
Fall83 <-subset(Fall, Year>1982)
Winter83 <- subset(Winter, Year>1982)

#Spring GAM
SpringGAM <- gam(pCO2 ~ s(chla, k=6) + s(Chla_min_3, k=6)+ s(temp, k=6) +s(pCO2_min_1, k=6), data = Spring,
                        family = scat, method = "REML", select = TRUE)
summary(SpringGAM)
plot(SpringGAM, shift = coef(SpringGAM)[1], pages =1, all.terms=TRUE)

plot(SpringGAM, pages=1)
layout(matrix(1:4, ncol = 2, byrow = TRUE))
gam.check(SpringGAM, rep = 100)
layout(1)


#Summer GAM
SummerGAM <- gam(pCO2 ~ s(chla, k=6) + +s(Chla_min_1, k=6)+ s(temp, k=6) +s(IceDuration, k=6) +s(pCO2_min_1, k=6), data = Summer83,
                 family = scat, method = "REML", select = TRUE)
summary(SummerGAM)
plot(SummerGAM, shift = coef(WinterGAM)[1], pages =1, all.terms=TRUE)

plot(SummerGAM, pages=1)
layout(matrix(1:4, ncol = 2, byrow = TRUE))
gam.check(SummerGAM, rep = 100)
layout(1)

#Fall GAM
FallGAM <- gam(pCO2 ~ s(chla, k=6) + +s(Chla_min_1, k=6)+ s(temp, k=7) +s(IceDuration, k=6) +s(pCO2_min_1, k=6), data = Fall83,
                 family = scat, method = "REML", select = TRUE)
summary(FallGAM)
plot(FallGAM, shift = coef(FallGAM)[1], pages =1, all.terms=TRUE)

plot(FallGAM, pages=1)
layout(matrix(1:4, ncol = 2, byrow = TRUE))
gam.check(FallGAM, rep = 100)
layout(1)



