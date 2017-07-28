#ddply 

#1

batting <- read.csv("batting.csv", header = TRUE)
batting2015 <- batting %>% filter(yearID == 2015)
triples <- ddply(.data = batting2015, .variables = "teamID", .fun = summarize, tri = sum(X3B))
triples <- triples[order(triples$tri, decreasing = T), ]
triples
# Colorado Rockies and Detroit Tigers - 49 

#2 

Doubles <- ddply(.data = batting2015, .variables = "lgID", .fun = summarise, sum(X2B))
Doubles
# AL- 4166
# NL- 4076

#3


anghr <- ddply(.data = batting2015, .variables = "lgID", .fun = summarise,avghr_perday = (sum(HR)/(sum(G)/15)*(15)))
anghr
Homeruns <- ddply(.data = batting2015, .variables = "lgID", .fun = summarise, sum(HR))
#AL- 16.88
#NL- 14.45




sum(batting2015$HR)
15*162
hr_pergame <- 4909/2430
# 2.02 HR per game * 15 games per day
# 30.3 



#ggplot

#1- bar chart

triples <- ddply(.data = batting2015, .variables = "teamID", .fun = summarize, tri = sum(X3B))
ggplot(triples, aes(x = teamID, y = tri)) + geom_bar(stat = "Identity")


#2- line chart 


#3- 


# subsetting- 

#1-

braves_brews <- batting2015[batting2015$teamID == c("ATL","MIL"),]

#2- 

hr_15 <- batting2015[batting2015$HR>=15, ]
hr_15

length(hr_15)

#3- 

cubs <- batting2015[batting2015$teamID == "CHN", c(1,12)]
cubs

