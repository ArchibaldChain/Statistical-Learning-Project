# Loading standarding data
train_stand = read.table("data/train_stand.csv", header = T, na.string = "?", sep = ",")
test_stand = read.table("data/test_stand.csv", header = T, na.string = "?", sep = ",")

### Full Model
pairs(train_stand)
lm.full = lm(medv~., data = train_stand)
summary(lm.full)

beta_full = coefficients(lm.full)
R_2_full = R_square(test_stand[,ncol(test_stand)], test_stand[,1:ncol(test_stand)-1], beta_full)
RSE_full = RSE(test_stand[,ncol(test_stand)], test_stand[,1:ncol(test_stand)-1], beta_full) 
Adjusted_R_2_full = Adjusted_R_square(test_stand[,ncol(test_stand)], test_stand[,1:ncol(test_stand)-1], beta_full)


### Backward Model
regfit.bwd = regsubsets(medv~.,data=train_stand ,nvmax=19, method="backward")
summary(regfit.bwd)

lm.bwd = lm(medv~rm + age + dis + ptratio + black + lstat, data = train_stand)
summary(lm.bwd)

beta_bwd =coefficients(lm.bwd)
test_stand_1 = test_stand[,-10][,-9][,-5][,-4][,-3][,-2][,-1]
R_2_bwd = R_square(test_stand[,ncol(test_stand)], test_stand_1, beta_bwd)
RSE_bwd = RSE(test_stand[,ncol(test_stand)], test_stand_1, beta_bwd) 
Adjusted_R_2_bwd = Adjusted_R_square(test_stand[,ncol(test_stand)], test_stand_1, beta_bwd)


### Lasso adjusted
library(Matrix)
library(foreach)
library(glmnet)
x_train = model.matrix(medv~., train_stand)[,-1]
x_test = model.matrix(medv~., test_stand)[,-1]
y_train = train_stand$medv
y_test = test_stand$medv

grid = 10^seq(10, -2, length = 100)
lasso.mod=glmnet(x_train,y_train,alpha=1,lambda=grid)
plot(lasso.mod)

set.seed(1)
cv.out = cv.glmnet(x_train, y_train, alpha = 1)
plot(cv.out)

bestlam=cv.out$lambda.min

lasso.pred=predict(lasso.mod,s=bestlam ,newx=x_test)
plot(lasso.pred)
mean((lasso.pred -y_test)^2)
print(bestlam)

#coefficients 
Beta_lasso = predict(lasso.mod,type="coefficients",s=bestlam)


R_2_lasso = R_square(y_test,x_test, beta_lasso)
RSE_lasso = RSE(y_test,x_test, beta_lasso)
Adjusted_R_2_Lasso = Adjusted_R_square(y_test, x_test, beta_lasso)


R_2_lasso = R_square(y_train, x_train, beta_lasso)
RSE_lasso = RSE(y_train,x_train, beta_lasso)
Adjusted_R_2_Lasso = Adjusted_R_square(y_train, x_train, beta_lasso)

### Lasso + Stepwise

x_train = model.matrix(medv~rm + age + dis + ptratio + black + lstat, train_stand)[,-ncol(train_stand)]
x_test = model.matrix(medv~rm + age + dis + ptratio + black + lstat, test_stand)[,-ncol(test_stand)]
y_train = train_stand$medv
y_test = test_stand$medv

grid = 10^seq(10, -2, length = 100)
lasso.mod=glmnet(x_train,y_train,alpha=1,lambda=grid)
plot(lasso.mod)

set.seed(1)
cv.out = cv.glmnet(x_train, y_train, alpha = 1)
plot(cv.out)

bestlam=cv.out$lambda.min

lasso.pred=predict(lasso.mod,s=bestlam ,newx=x_test)
mean((lasso.pred -y_test)^2)
print(bestlam)

#coefficients 
Beta_lasso = predict(lasso.mod,type="coefficients",s=bestlam)


R_2_lasso = R_square(test_stand, x_test, beta_lasso)
RSE_lasso = RSE(y_test,x_test, beta_lasso)
Adjusted_R_2_Lasso = Adjusted_R_square(y_test, x_test, beta_lasso)


R_2_lasso = R_square(y_train, x_train, beta_lasso)
RSE_lasso = RSE(y_train,x_train, beta_lasso)
Adjusted_R_2_Lasso = Adjusted_R_square(y_train, x_train, beta_lasso)