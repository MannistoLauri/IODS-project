#Lauri Männistö
#3.11.2023
#Script to data wrangling assigment 2


#reading the data, stores as "learning"
learning = read.table(url('https://www.mv.helsinki.fi/home/kvehkala/JYTmooc/JYTOPKYS3-data.txt'),sep='\t', header = TRUE)

#dimensions
dim(learning)
#learning has 183 rows (observations) and 60 colums (variables)

#structure
str(learning)
# all varables exluding gender are integrals whereas gender is storied as characters


# questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# select the columns related to deep learning 
deep_columns <- select(learning, one_of(deep_questions))
# and create column 'deep' by averaging
learning$deep <- rowMeans(deep_columns)

# select the columns related to surface learning 
surface_columns <- select(learning, one_of(surface_questions))
# and create column 'surf' by averaging
learning$surf <- rowMeans(surface_columns)

# select the columns related to strategic learning 
strategic_columns <- select(learning, one_of(strategic_questions))
# and create column 'stra' by averaging
learning$stra=rowMeans(strategic_columns)

#create vector of desired variables
variables=c("gender","Age","Attitude","deep","stra","surf", "Points")

#create data for analysis
analysisdata=select(learning,variables)

#remove observations with points=0
analysisdata=filter(analysisdata, Points >0)

#set the working directory
setwd("C:/Users/03196349/Work Folders/PhD opinnot/IODS/IODS-project")

#write csv to data folder located in working dir
write.csv(x=analysisdata, file = "data/learning2014.csv")

#read the data we just saved as .csv
readData=read.csv(file="data/learning2014.csv", header = TRUE)

#check the structure of data
str(readData)
#8 variables, 166 observations. Looks good!

#print the first rows
head(readData)
#still good!