library(BasketballAnalyzeR)
library(gridExtra)
library(ggplot2)
library(dplyr)

Pbox <- readRDS(file = 'Pboxb.rds')
Obox <- readRDS(file = 'Oboxb.rds')
Tbox <- readRDS(file = 'Tboxb.rds')

FF <- fourfactors(Tboxb, Oboxb)
listPlots <- plot(FF)

#Team Pace
grid.arrange(grobs = listPlots[1], ncol = 1)

#Offensive / Defenseive Ratings of the team
grid.arrange(grobs = listPlots[2], ncol = 1)

Tbox$DRtg <- FF$DRtg
ggplot(Tbox, aes(x = DRtg, y = W, label = Team)) +
  geom_point() +
  geom_label()

Tbox$ORtg <- FF$ORtg
ggplot(Tbox, aes(x = ORtg, y = W, label = Team)) +
  geom_point() +
  geom_label()



#Top 8 Four Factors
tm <- c('Blois', 'Quimper', 'Nancy', 'Antibes', 'Lille',
        'Saint-Chamond', 'Denain', 'Souffelweyersheim')
selTTeams <- which(Tboxb$Team %in% tm)
selOTeams <- which(Oboxb$away_team %in% tm)
FF <- fourfactors(Tboxb[selTTeams, ], Oboxb[selTTeams, ])
listPlots <- plot(FF)

#Offensive Four factors
grid.arrange(grobs = listPlots[3], ncol = 1)

#Defensive Four factors
grid.arrange(grobs = listPlots[4], ncol = 1)