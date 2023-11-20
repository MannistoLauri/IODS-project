#Data wrangling for excercise 3.
#Lauri Männistö
#16.11.2023


mat=read.csv(file="C:/Users/03196349/Work Folders/PhD opinnot/IODS/IODS-project/data/student-mat.csv", sep= ";", header = TRUE)
por=read.csv(file="C:/Users/03196349/Work Folders/PhD opinnot/IODS/IODS-project/data/student-por.csv", sep= ";", header = TRUE)


## dimensions and structurie of student-mat
dim(mat)
str(mat)

## dimensions and structurie of student-por
dim(por)
str(por)

#joining
#colums excludes
free_cols=c("failures","paid","absences","G1","G2","G3")
#colums included
join_cols=setdiff(colnames(por), free_cols)
#Joining by join_cols
mat_por=inner_join(mat, por, by = join_cols)

dim(mat_por)
str(mat_por)


#remove duplicates
alc =select(mat_por, all_of(join_cols))

for(col_name in free_cols) {
  # select two columns from 'math_por' with the same original name
  two_cols <- select(mat_por, starts_with(col_name))
  # select the first column vector of those two columns
  first_col <- select(two_cols, 1)[[1]]
  
  # then, enter the if-else structure!
  # if that first column vector is numeric...
  if(is.numeric(first_col)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    alc[col_name] <- round(rowMeans(two_cols))
  } else { # else (if the first column vector was not numeric)...
    # add the first column vector to the alc data frame
    alc[col_name] <- "change me!"
  }
}



# define a new column alc_use by combining weekday and weekend alcohol use
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)

# define a new logical column 'high_use'
alc <- mutate(alc, high_use = alc_use > 2)


glimpse(alc)
 #write csv
write.csv(x=alc, file="C:/Users/03196349/Work Folders/PhD opinnot/IODS/IODS-project/data/alcdata.csv")
