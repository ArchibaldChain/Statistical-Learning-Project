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

boxplot(medv~1,data=Boston, main="Car Milage Data", xlab="Number of Cylinders", ylab="Miles Per Gallon")

standardizing = function(x){
    x = xapply
}