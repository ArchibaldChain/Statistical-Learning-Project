# 
set.seed(1)
sub<-sample(1:nrow(Boston),round(nrow(Boston)*2/3))
length(sub)
data_train<-Boston[sub,]#取2/3的数据做训练集
data_test<-Boston[-sub,]#取1/3的数据做测试集
dim(data_train)#训练集行数和列数13542 23
dim(data_test) #测试集的行数和列数6771 23
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
