#Lauri Männistö
#5.12.2023
#Data wrangling 6

#Import data

BPRS= read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep =" ", header = T)
RATS=read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep ="\t", header = T)

#explore data
str(BPRS)
dim(BPRS)
View(BPRS)

str(RATS)
dim(RATS)
View(RATS)

BPRS$treatment=factor(BPRS$treatment)
RATS$Group=factor(RATS$Group)


BPRSL = pivot_longer(BPRS, cols = -c(treatment, subject),
                       names_to = "weeks", values_to = "bprs") %>%
  arrange(weeks)
BPRSL =  BPRSL %>% 
  mutate(week = as.integer(substr(BPRSL$weeks,5,5)))


RATSL = pivot_longer(RATS, cols = -c(ID, Group), 
                      names_to = "WD",
                      values_to = "Weight") %>% 
  mutate(Time = as.integer(substr(WD,3,4))) %>%
  arrange(Time)

str(BPRSL)
dim(BPRSL)
colnames(BPRSL)
summary(BPRSL)


str(RATSL)
dim(RATSL)
colnames(RATSL)
summary(RATSL)

write.csv(BPRSL, "C:/Users/03196349/Work Folders/PhD opinnot/IODS/IODS-project/data/BPRSL.csv")
write.csv(RATSL, "C:/Users/03196349/Work Folders/PhD opinnot/IODS/IODS-project/data/RATSL.csv")
