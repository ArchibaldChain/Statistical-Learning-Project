# The function was used to seperate data into training sets and test sets
set.seed(1)
sub<-sample(1:nrow(Boston),round(nrow(Boston)*2/3))
length(sub)
data_train<-Boston[sub,]# get 2/3 of data as training sets
data_test<-Boston[-sub,]# get 1/3 of data as test sets
dim(data_train)
dim(data_test) 
head(data_train)
head(data_test)
write.table(data_train, file = "data/data_train.csv", append = FALSE, quote = TRUE, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")
write.table(data_test, file = "data/data_test.csv", append = FALSE, quote = TRUE, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")
