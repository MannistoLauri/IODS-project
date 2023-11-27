#Lauri Männistö
#27.11.2023


#instal packages
library(readr)

#import data
hd <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/human_development.csv")
gii <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/gender_inequality.csv", na = "..")

#explore data
dim(hd)
dim(gii)
str(hd)
str(gii)

summary(hd)
summary(gii)

# replace colum names
colnames(hd)= c("HDI.Rank", "Country", "HDI", "Life.Exp", "Edu.Exp", "Edu.Mean", "GNI", "GNI.Minus.Rank")
colnames(gii)=c("GII.Rank", "Country", "GII", "Mat.Mor", 
                "Ado.Birth", "Parli.F", "Edu2.F", "Edu2.M", 
                "Labo.F", "Labo.M")

#calclulate variables
gii= mutate(gii, Edu2.FM = Edu2.F / Edu2.M)
gii= mutate(gii, Labo.FM = Labo.F / Labo.M)


#More packages
library(dplyr)

#join the data
joindata= inner_join(x=hd, y=gii, by = "Country")
dim(joindata)


#write csv
write.csv(x=joindata, file="C:/Users/03196349/Work Folders/PhD opinnot/IODS/IODS-project/data/human.csv")


#all done