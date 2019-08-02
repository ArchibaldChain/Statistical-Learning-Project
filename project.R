library(MASS)
names(Boston)
pairs(~., Boston)
Boston = read.table("data/Boston.csv", header = T, na.string = "?", sep = ",")
fix(Boston)
names = as.factor(names(Boston))
attach(Boston)
pairs(~.-chas, data = Boston)
plot(medv)
plot(1, medv)
plot(as.factor(1), medv)

chasFactor = as.factor(chas)
ls.all=lm(medv~.-chas + chasFactor,data = Boston)
summary(ls.all)

ls.allre=lm(medv~.-age-indus, data = Boston)
summary(ls.allre)

lm.fit1 = lm(medv~age, data = Boston)
plot(age, medv)
abline(lm.fit1, col = "red")
plot(chas, medv)
lm.fit2 = lm(medv~chas, data = Boston)
abline(lm.fit2, col = 'red')

plot(dis, medv)

### Stepwise
### Forword
##

library(leaps)
regfit.fwd=regsubsets (medv~.,data=Boston ,nvmax=19,method="forward")
summary(regfit.fwd)

library(RColorBrewer)
library(ggplot2)

ggplot(stack(as.data.frame(scale(Boston))), aes(x = ind, y = values)) +geom_boxplot(fill = brewer.pal(7, "Blues")[4], color = brewer.pal(7, "Blues")[6])
# fill = brewer.pal(6, "oranges")[4], color = brewer.pal(7, "oranges")[6]

### Data split
data_test = read.table("data/data_test.csv", header = T, na.string = "?", sep = ",")

### Standardizing the data

matrix_Boston = matrix(data = Boston[2:506,])

standard_Boston = standardizing(Boston)
head(standard_Boston)
standard_Boston[,"chas"]

ggplot(stack(as.data.frame(scale(standard_Boston))), aes(x = ind, y = values)) +geom_boxplot(fill = brewer.pal(7, "Oranges")[4], color = brewer.pal(7, "Oranges")[6])


#### Save data
write.table(standard_Boston, file = "data/Boston_stand.csv", append = FALSE, quote = TRUE, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")
train_stand = standardizing(data_train)
test_stand = standardizing(data_test)
write.table(train_stand, file = "data/train_stand.csv", append = FALSE, quote = TRUE, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")
write.table(test_stand, file = "data/test_stand.csv", append = FALSE, quote = TRUE, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")
