# Loading standarding data
train_stand = read.table("data/test_stand.csv", header = T, na.string = "?", sep = ",")
test_stand = read.table("data/test_stand.csv", header = T, na.string = "?", sep = ",")

# Full Model
# 
pairs(train_stand)
lm.full = lm(medv~., data = train_stand)
summary(lm.full)

beta_full = coefficients(lm.full)
R_2_full = R_square(test_stand[,ncol(test_stand)], test_stand[,1:ncol(test_stand)-1], beta_full)
RSE_full = RSE(test_stand[,ncol(test_stand)], test_stand[,1:ncol(test_stand)-1], beta_full) 

# Forward Model
library(leaps)
regfit.fwd = regsubsets(medv~.,data=train_stand ,nvmax=19, method="forward")
summary(regfit.fwd)

lm.fwd = lm(medv~+crim+zn+chas+nox+rm+age+dis+rad+tax+ptratio+black+lstat, data = train_stand)
summary(lm.fwd)

beta_fwd = coefficients(lm.fwd)
R_2_fwd = R_square(test_stand[,ncol(test_stand)], test_stand[,-ncol(test_stand)-1][,-3], beta_fwd)
RSE_fwd = RSE(test_stand[,ncol(test_stand)], test_stand[,1:ncol(test_stand)-1][,-3], beta_fwd) 

# Backward Model
regfit.bwd = regsubsets(medv~.,data=train_stand ,nvmax=19, method="backward")
summary(regfit.bwd)

lm.bwd = lm(medv~nox+rm+dis+tax+ptratio+lstat, data = train_stand)
summary(lm.bwd)

beta_bwd =coefficients(lm.bwd)
test_stand_1 = test_stand[,-12][,-9][,-7][,-4][,-3][,-2][,-1]
R_2_bwd = R_square(test_stand[,ncol(test_stand)], test_stand_1, beta_fwd)
RSE_bwd = RSE(test_stand[,ncol(test_stand)], test_stand_1, beta_fwd) 
