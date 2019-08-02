# Statistical Learning Project: Predication and Explanation for Boston house price

**NAME:  钱彦兆, 王晨凯** 

**ID: 11711311, 11710619** 

**Grade: Sophomore**



### 1 Introduction

Boston house price is one of most famous statistic problem in the last century. So we try to analyze the house price data on our own method. We used the linear regression model to to fit the data. Then, to optimize data, we used stepwise method to select variable. After that, we used Lasso method to fit data.



#### 1.1 Datasets

Our data comes from an old essay about Boston house price, *Hedonic prices and the demand for clean air* .

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

And we will use test set to assess our model. Besides, the variable of "chas" is already dummied.

#### 1.2 Data Visualization

We drew a panel  of scatterplot  for a pair of variables whose identities are given by the corresponding row and column labels.

![](Graph/paris.png)

The box graph of all variables was shown to illustrate the data distribution.

![](Graph/plot_databox_png.png)

#### 1.3 Data Standardizing

In the Lasso model, we need use the formula below to standardizing the data:
$$
\widetilde x_{i,j} = \frac{x_{i,j}}{\sqrt{{\frac{1}{n}}\sum_{i=1}^{n}(\frac{x_{i,j}}{x_{i,j}-\bar x_j})^2}}
$$

After standarded, the head of data is shown below:

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

​		where RSS(residual sum of squares) is:
$$
RSS = \sum_{i=1}^{n}(y_i - \hat{y}_i)^2
$$

2. **R^2^ Statistic**
$$
R^2 = \frac{TSS-RSS}{TSS} = 1 - \frac{RSS}{TSS}
$$
​		where TSS(total sum of squares) is:
$$
TSS = \sum_{i=1}^{n}(y_i - \bar{y}_i)^2
$$


### 2 Model Selection and Implementation

#### 2.1 Full Model

#### 2.2 Forward Selection

#### 2.3 Backward Selection

#### 2.4 Lasso Model

##### 2.4.1 Select Lambda

#### 2.5 Lasso + Stepwise



### 3 Assess the Model







### References

[1] Harrison, D. and Rubinfeld, D.L. (1978) Hedonic prices and the demand for clean air. J. Environ. Economics and Management 5, 81–102.