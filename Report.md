# Statistical Learning Project: Analysis of Boston house price

**NAME:  钱彦兆, 王晨凯** 

**ID: 11711311, 11710619** 

**Grade: Sophomore**



### 1 Introduction

​	 Boston house price is one of the most famous statistic problems in the last century. So we try to analyze the house price through classical statistical methods and find out the major and minor factors that affects the price. According to our goal, linear regression is the best choice. 

​	We collected enough data and did some preprocessing: we randomly selected 2/3 as training data and set the remaining as test data. The training data is used to train the linear model and the test data is used to assess the model.For problems with multiple variables such as Boston house price, there are several typical ways to optimize the model. We tried these optimization methods and found out the  optimum fitting of the problem.






#### 1.1 Datasets

Our data come from an old essay about Boston house price, *Hedonic prices and the demand for clean air* .

| Variable | Definition                                                   | Source                                       |
| -------- | ------------------------------------------------------------ | -------------------------------------------- |
| medv     | Median Value of owner-occupied                               | 1970 U. S. Census                            |
| rm       | Average number of rooms per dwelling.                        | 1970 U. S. Census                            |
| age      | Proportion of owner-occupied units built prior to 1940.      | 1970 U. S. Census                            |
| black    | 1000(Bk - 0.63)^2 where Bk is the proportion of blacks by own. | 1970 U. S. Census                            |
| lstat    | Lower status of the population(percent).                     | 1970 U. S. Census                            |
| crim     | Per crime rate by town.                                      | FBI (1970)                                   |
| zn       | Proportion of a town's residential land zoned fro lots greater that 25,000 square feet. | Metropolitan Area Planning Commission (1972) |
| indus    | Proportion non-retail business acres per town.               | Vogt, Ivers, and Association                 |
| tax      | Full value property tax rate (\$/\$10,000).                  | Massachusetts Tax-payers Foundation(1970)    |
| ptratio  | Pupil-teacher ratio by town school district                  | Massachusetts Dept. of Education (1971-1972) |
| chas     | Charles River dummy := 1 if tract bounds the Charles River; 0 if otherwise. | 1970 U. S. Census Tract maps                 |
| dis      | Weighted distances to five employment centers in the Boston region. | Schnare                                      |
| rad      | Index of accessibility to radical highways.                  | MIT Boston Project                           |
| nox      | Nitrogen oxides concentration in pphm (annual aver-age concentration in parts per hundred million). | TASSIM                                       |



We randomly divided the data into two sets: 

- Training set: randomly chosen 2/3 of origin sets,

- Test set: randomly chosen 1/3 of origin sets. 

And we will use test setting to assess our model. Besides, the variable of "chas" is already dummied.

#### 1.2 Data Visualization

We drew a panel  of scatterplot  for a pair of variables whose identities are given by the corresponding row and column labels.

![](Graph/paris.png)

The box graph of all variables was shown to illustrate the data distribution.

![](Graph/plot_databox_png.png)

#### 1.3 Data Standardizing

In the Lasso model, we need to use the formula below to standardizing the data:
$$
\widetilde x_{i,j} = \frac{x_{i,j}}{\sqrt{{\frac{1}{n}}\sum_{i=1}^{n}(\frac{x_{i,j}}{x_{i,j}-\bar x_j})^2}}
$$

After standardization, the head of data is shown below:

| zn       | indus    | chas | nox      | rm       | age      | dis      | rad      | tax      | ptratio  | black    | lstat    | medv     |
| -------- | -------- | ---- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- |
| 0.808794 | 0.107039 | 0    | 0.024217 | 0.301427 | 3.285297 | 0.185721 | 0.04567  | 6.304818 | 0.727945 | 7.082784 | 0.231909 | 1.148223 |
| 0        | 0.34765  | 0    | 0.022368 | 0.312204 | 4.19072  | 0.239091 | 0.096855 | 5.145127 | 0.899769 | 7.060669 | 0.451788 | 1.09814  |
| 0        | 0.351682 | 0    | 0.022624 | 0.353389 | 3.272702 | 0.241842 | 0.097973 | 5.136803 | 0.910231 | 6.976837 | 0.201515 | 1.784631 |
| 0        | 0.110867 | 0    | 0.022595 | 0.351951 | 2.479367 | 0.301846 | 0.150278 | 4.680136 | 0.977038 | 6.96521  | 0.150288 | 1.754769 |
| 0        | 0.110153 | 0    | 0.022443 | 0.357083 | 2.930941 | 0.299832 | 0.149284 | 4.696069 | 0.971178 | 7.026242 | 0.270726 | 1.890694 |

The box graph of those data after standardizing is shown below:

![](Graph/data_distri_after_standard.png)

#### 1.3 Model assess

We use some statistical concept to assess our model:

1. **Residual Standard Error**
$$
RSE = \sqrt[]{\frac{RSS}{n-2}}
$$

​		Where RSS(residual sum of squares) is:
$$
RSS = \sum_{i=1}^{n}(y_i - \hat{y}_i)^2
$$

2. **R^2^ Statistic**
$$
R^2 = \frac{TSS-RSS}{TSS} = 1 - \frac{RSS}{TSS}
$$
​		Where TSS(total sum of squares) is:
$$
TSS = \sum_{i=1}^{n}(y_i - \bar{y}_i)^2
$$

3. **Adjusted-R^2^ statistic**

$$
R^2 = \frac{TSS-RSS}{TSS} = 1 - \frac{RSS/(n-d-1)}{TSS/(n-1)}
$$

### 2 Model Selection and Implementation

​	Our goal is finding out the major and minor factors that affect the price. Although the linear model is more restrictive,  linear model is of good explanatory, so the linear model is the best choice. Assuming that we don't choose a linear model, but choose other models with higher flexibility, we need to train the model with much bigger data than the training data used in  linear model  and the model we get is difficult to explain how any individual predictor is associated with the response.

#### 2.1 Full Model

|           | Estimate  | Std.Error | t value | Pr(>\|t\|) |
| --------- | --------- | --------- | ------- | ---------- |
| intercept | 0.210528  | 0.252044  | 0.835   | 0.404177   |
| crim      | -0.048952 | 0.053972  | -0.907  | 0.365087   |
| zn        | 0.028821  | 0.014665  | 1.965   | 0.050246   |
| indus     | 0.026266  | 0.063904  | 0.411   | 0.681325   |
| chas      | 0.096118  | 0.031029  | 3.098   | 0.002122   |
| nox       | -8.215957 | 4.023916  | -2.042  | 0.041985   |
| rm        | 7.433033  | 0.455925  | 16.303  | <0.0001    |
| age       | -0.028337 | 0.012587  | -2.251  | 0.025042   |
| dis       | -1.195338 | 0.210403  | -5.681  | <0.0001    |
| rad       | 0.345224  | 0.093474  | 3.693   | 0.000260   |
| tax       | -0.041890 | 0.012559  | -3.335  | 0.000951   |
| ptratio   | -0.742733 | 0.125414  | -5.922  | <0.0001    |
| black     | 0.031737  | 0.008901  | 3.565   | 0.000418   |
| lstat     | -0.285383 | 0.059129  | -4.826  | <0.0001    |

**full model**

|               | RSE    | $R^2$  | Adjusted $R^2$ |
| :-----------: | ------ | ------ | -------------- |
| training data | 0.1508 | 0.8762 | 0.8712         |
|   test data   | 0.1106 | 0.8324 | 0.8172         |


#### 2.2 Stepwise Selection

|           | Estimate  | Std.Error | t value | Pr(>\|t\|) |
| --------- | --------- | --------- | ------- | ---------- |
| intercept | -0.340526 | 0.061531  | -5.534  | <0.0001    |
| rm        | 8.262658  | 0.279706  | 29.541  | <0.0001    |
| age       | -0.040181 | 0.012491  | -3.217  | 0.00142    |
| dis       | -0.920175 | 0.171070  | -5.379  | <0.0001    |
| ptratio   | -0.709611 | 0.105491  | -6.727  | <0.0001    |
| black     | 0.035939  | 0.006729  | 5.341   | <0.0001    |
| lstat     | -0.278504 | 0.055662  | -5.004  | <0.0001    |



|               | RSE    | $R^2$  | Adjusted $R^2$ |
| ------------- | ------ | ------ | -------------- |
| training data | 0.1573 | 0.8624 | 0.8599         |
| test data     | 0.1521 | 0.6830 | 0.6692         |



#### 2.3 Lasso Model


$$
\sum_{i=1}^{n}(y_i - \beta_0 - \sum_{j=1}^{p}\beta_jx_{ij})^2 + \lambda\sum_{j=1}^{p}\vert\beta_j\vert = RSS + \lambda\sum_{j = 1}^{p}\vert\beta_j\vert
$$


test

$R^{2} = 0.7823308  $            $RSE = $ 0.1260907         $Adjusted-R^2 = 0.7625427$

train

$R^{2} = 0.7941389  $            $RSE = $ 0.1914669         $Adjusted-R^2 = $0.7851884



Some of those coefficients go to zero denpending on the choice of tuning parameter.

![](Graph/lasso_model.png)

We can also see the Mean-Value Error become bigger as $\lambda$ becomes larger.

![](Graph/lasso_model_mse.png)

And the $\lambda%$ was chosen as:
$$
\lambda = 0.0003384039
$$


|               | RSE    | $R^2$  | Adjusted $R^2$ |
| ------------- | ------ | ------ | -------------- |
| training data | 0.1915 | 0.7941 | 0.7852         |
| test data     | 0.1261 | 0.7823 | 0.7625         |



### 3 Assess the Model







### References

[1] Harrison, D. and Rubinfeld, D.L. (1978) Hedonic prices and the demand for clean air. J. Environ. Economics and Management 5, 81–102.



### Appendix

#### 1. Full model Summary

```
Call:
lm(formula = medv ~ ., data = train_stand)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.30594 -0.09052 -0.02251  0.05955  0.66238 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.210528   0.252044   0.835 0.404177    
crim        -0.048952   0.053972  -0.907 0.365087    
zn           0.028821   0.014665   1.965 0.050246 .  
indus        0.026266   0.063904   0.411 0.681325    
chas         0.096118   0.031029   3.098 0.002122 ** 
nox         -8.215957   4.023916  -2.042 0.041985 *  
rm           7.433033   0.455925  16.303  < 2e-16 ***
age         -0.028337   0.012587  -2.251 0.025042 *  
dis         -1.195338   0.210403  -5.681 2.99e-08 ***
rad          0.345224   0.093474   3.693 0.000260 ***
tax         -0.041890   0.012559  -3.335 0.000951 ***
ptratio     -0.742733   0.125414  -5.922 8.12e-09 ***
black        0.031737   0.008901   3.565 0.000418 ***
lstat       -0.285383   0.059129  -4.826 2.15e-06 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.1508 on 323 degrees of freedom
Multiple R-squared:  0.8762,	Adjusted R-squared:  0.8712 
F-statistic: 175.8 on 13 and 323 DF,  p-value: < 2.2e-16
```

#### 2. Stepwis Model Summary

```
Subset selection object
Call: regsubsets.formula(medv ~ ., data = train_stand, nvmax = 19, 
    method = "backward")
13 Variables  (and intercept)
        Forced in Forced out
crim        FALSE      FALSE
zn          FALSE      FALSE
indus       FALSE      FALSE
chas        FALSE      FALSE
nox         FALSE      FALSE
rm          FALSE      FALSE
age         FALSE      FALSE
dis         FALSE      FALSE
rad         FALSE      FALSE
tax         FALSE      FALSE
ptratio     FALSE      FALSE
black       FALSE      FALSE
lstat       FALSE      FALSE
1 subsets of each size up to 13
Selection Algorithm: backward
          crim zn  indus chas nox rm  age dis rad tax ptratio black lstat
1  ( 1 )  " "  " " " "   " "  " " "*" " " " " " " " " " "     " "   " "  
2  ( 1 )  " "  " " " "   " "  " " "*" " " " " " " " " "*"     " "   " "  
3  ( 1 )  " "  " " " "   " "  " " "*" " " " " " " " " "*"     " "   "*"  
4  ( 1 )  " "  " " " "   " "  " " "*" " " " " " " " " "*"     "*"   "*"  
5  ( 1 )  " "  " " " "   " "  " " "*" " " "*" " " " " "*"     "*"   "*"  
6  ( 1 )  " "  " " " "   " "  " " "*" "*" "*" " " " " "*"     "*"   "*"  
7  ( 1 )  " "  " " " "   "*"  " " "*" "*" "*" " " " " "*"     "*"   "*"  
8  ( 1 )  " "  " " " "   "*"  " " "*" "*" "*" "*" " " "*"     "*"   "*"  
9  ( 1 )  " "  " " " "   "*"  " " "*" "*" "*" "*" "*" "*"     "*"   "*"  
10  ( 1 ) " "  " " " "   "*"  "*" "*" "*" "*" "*" "*" "*"     "*"   "*"  
11  ( 1 ) " "  "*" " "   "*"  "*" "*" "*" "*" "*" "*" "*"     "*"   "*"  
12  ( 1 ) "*"  "*" " "   "*"  "*" "*" "*" "*" "*" "*" "*"     "*"   "*"  
13  ( 1 ) "*"  "*" "*"   "*"  "*" "*" "*" "*" "*" "*" "*"     "*"   "*" 
```

```
### Linear fit after selection
Call:
lm(formula = medv ~ rm + age + dis + ptratio + black + lstat, 
    data = train_stand)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.34241 -0.08930 -0.02355  0.05557  0.77534 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) -0.340526   0.061531  -5.534 6.38e-08 ***
rm           8.262658   0.279706  29.541  < 2e-16 ***
age         -0.040181   0.012491  -3.217  0.00142 ** 
dis         -0.920175   0.171070  -5.379 1.42e-07 ***
ptratio     -0.709611   0.105491  -6.727 7.67e-11 ***
black        0.035939   0.006729   5.341 1.73e-07 ***
lstat       -0.278504   0.055662  -5.004 9.17e-07 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.1573 on 330 degrees of freedom
Multiple R-squared:  0.8624,	Adjusted R-squared:  0.8599 
F-statistic: 344.7 on 6 and 330 DF,  p-value: < 2.2e-16
```

#### 3. Coefficients of Lasso Model

```

                       1
(Intercept) -0.304039998
crim         .          
zn           0.003968544
indus        .          
chas         0.085196766
nox          .          
rm           7.177225496
age         -0.006933422
dis         -0.339243362
rad          .          
tax          .          
ptratio     -0.523044728
black        0.024274317
lstat       -0.353402328
```

