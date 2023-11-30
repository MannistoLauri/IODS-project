#data wrangling 5
#Lauri Männistö
#30.11.2023
#suorce for data used: https://hdr.undp.org/data-center/human-development-index#/indicies/HDI


human=read.csv("C:/Users/03196349/Work Folders/PhD opinnot/IODS/IODS-project/data/human.csv")
human=human[,-1]
str(human)
dim(human)

#HDI="Human Development Index (HDI)"
#Life.exp="Life Expectancy at Birth"
#edu.exp="Expected Years of Education"
#edu.mean="Mean Years of Education"
#GNI="Gross National Income (GNI) per Capita"
#GNI.Minus.Rank="GNI per Capita Rank Minus HDI Rank"
#GII="Gender Inequality Index (GII)"  
#Mat.Mor="Maternal Mortality Ratio"
#Ado.Birth="Adolescent Birth Rate"
#Parli="Percent Representation in Parliament" 
#Edu2.F="Population with Secondary Education (Female)"
#Edu2.M="Population with Secondary Education (Male)"
#Labo.F="Labour Force Participation Rate (Female)"
#Labo.M="Labour Force Participation Rate (Male)"
#Edu2.FM="Population with Secondary Education (mean)"
#Labo.FM="Labour Force Participation Rate (Mean)"

include= c("Country", "Edu2.FM", "Labo.FM", "Edu.Exp", "Life.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human=select(human, one_of(include))
comp=complete.cases(human)
human=filter(human, comp)
unique(is.na(human))
##No NA values

tail(human, n= 10)

# 7 last observations are regions

last <- nrow(human) - 7
human <- human[1:last, ]

dim(human)
##looks good!

write.csv(x=human, file="C:/Users/03196349/Work Folders/PhD opinnot/IODS/IODS-project/data/human.csv")
