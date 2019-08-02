# Statistical Learning Project: Analysis of Boston house price

**NAME:  钱彦兆, 王晨凯** 

**ID: 11711311, 11710619** 

**Grade: Sophomore**



### 1 Introduction

​	Boston house price is one of the most famous statistic problems in the last century. So we try to analyze the house price data through classical statistical methods and find out the major and minor factors that affects the price. According to our goal, linear regression is the best choice. 

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

### 2 Model Selection and Implementation

#### 2.1 Full Model

```
Call:
lm(formula = medv ~ ., data = train_stand)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.29748 -0.06384 -0.01443  0.03943  0.52414 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)   0.685267   0.289184   2.370 0.019036 *  
crim         -0.130805   0.070029  -1.868 0.063667 .  
zn            0.049557   0.023113   2.144 0.033587 *  
indus        -0.039806   0.098869  -0.403 0.687788    
chas          0.007656   0.045912   0.167 0.867787    
nox         -10.733974   5.887119  -1.823 0.070185 .  
rm            5.261537   0.761009   6.914 1.16e-10 ***
age           0.007635   0.020272   0.377 0.706959    
dis          -1.152005   0.306350  -3.760 0.000240 ***
rad           0.142643   0.156371   0.912 0.363073    
tax          -0.052273   0.019673  -2.657 0.008706 ** 
ptratio      -0.734369   0.198354  -3.702 0.000296 ***
black         0.007676   0.014201   0.541 0.589619    
lstat        -0.422975   0.094634  -4.470 1.51e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.1148 on 155 degrees of freedom
Multiple R-squared:  0.8319,	Adjusted R-squared:  0.8178 
F-statistic:    59 on 13 and 155 DF,  p-value: < 2.2e-16
```

$R^{2} = 0.8324587  $            $RSE = 0.1106231$


#### 2.2 Stepwise Selection

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
2  ( 1 )  " "  " " " "   " "  " " "*" " " " " " " " " " "     " "   "*"  
3  ( 1 )  " "  " " " "   " "  " " "*" " " " " " " " " "*"     " "   "*"  
4  ( 1 )  " "  " " " "   " "  " " "*" " " " " " " "*" "*"     " "   "*"  
5  ( 1 )  " "  " " " "   " "  " " "*" " " "*" " " "*" "*"     " "   "*"  
6  ( 1 )  " "  " " " "   " "  "*" "*" " " "*" " " "*" "*"     " "   "*"  
7  ( 1 )  " "  "*" " "   " "  "*" "*" " " "*" " " "*" "*"     " "   "*"  
8  ( 1 )  "*"  "*" " "   " "  "*" "*" " " "*" " " "*" "*"     " "   "*"  
9  ( 1 )  "*"  "*" " "   " "  "*" "*" " " "*" "*" "*" "*"     " "   "*"  
10  ( 1 ) "*"  "*" " "   " "  "*" "*" " " "*" "*" "*" "*"     "*"   "*"  
11  ( 1 ) "*"  "*" "*"   " "  "*" "*" " " "*" "*" "*" "*"     "*"   "*"  
12  ( 1 ) "*"  "*" "*"   " "  "*" "*" "*" "*" "*" "*" "*"     "*"   "*"  
13  ( 1 ) "*"  "*" "*"   "*"  "*" "*" "*" "*" "*" "*" "*"     "*"   "*"  
```

```
Call:
lm(formula = medv ~ nox + rm + dis + tax + ptratio + lstat, data = train_stand)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.28819 -0.06646 -0.01705  0.04202  0.54804 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)   0.80089    0.21454   3.733 0.000262 ***
nox         -12.11196    5.03376  -2.406 0.017248 *  
rm            5.46786    0.67590   8.090 1.33e-13 ***
dis          -0.76712    0.22852  -3.357 0.000982 ***
tax          -0.05234    0.01332  -3.929 0.000126 ***
ptratio      -0.93286    0.17132  -5.445 1.89e-07 ***
lstat        -0.44895    0.08292  -5.414 2.19e-07 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.1152 on 162 degrees of freedom
Multiple R-squared:  0.8231,	Adjusted R-squared:  0.8166 
F-statistic: 125.7 on 6 and 162 DF,  p-value: < 2.2e-16
```

$R^{2} = 0.8237176  $            $RSE = $0.1134721

#### 2.4 Lasso Model

##### 2.4.1 Select Lambda

#### 2.5 Lasso + Stepwise



### 3 Assess the Model







### References

[1] Harrison, D. and Rubinfeld, D.L. (1978) Hedonic prices and the demand for clean air. J. Environ. Economics and Management 5, 81–102.