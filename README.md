
# LogisticRegression

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)

Logistic Regression Implementation for Binary Classification Problems

# Installation

You can download the package from my Github repository:

``` r
devtools::install_github('https://github.com/AlbertoAlmuinha/LogisticRegression')
```

# Usage

You can use the LogisticRegression package for binary classification
problems. It has two exported functions to work with:

  - create\_data\_partition: Function to split the dataset in train-test
    dataset. **All the dataset’s columns must be numeric.**

  - logistic\_regression: Function to predict over the test dataset
    based on the model generated on the train dataset.

The first step is to create the data partition:

``` r
OJ<-ISLR::OJ %>% select(1, c(4:12)) %>% mutate(Purchase = if_else(Purchase == 'CH', 1, 0))

library(LogisticRegression)

c(train, test) %<-% create_data_partition(OJ, 0.7)

dim(train)
```

    ## [1] 749  10

``` r
dim(test)
```

    ## [1] 321  10

Now we can predict the target variable with the logistic\_regression
function. This function returns a list of five elements: the predicted
train target, the predicted test target, optim theta (for gradient
descent algorithm), confusion matrix and confusion matrix plot (this two
last only when the parameter ‘probs’ is set to FALSE). The parameters of
the function are:

  - train: Train dataset.
  - test: Test dataset.
  - target: Numeric parameter indicating the position column of the
    target variable.
  - lr: Learning Rate for gradient descent algorithm.
  - max\_iter: Max number of iterations for gradient descent algorithm.
  - probs: When FALSE, results are factors, when TRUE, results are
    probabilities.
  - threshold: Numeric threshold for gradient descent algorithm.
  - regu\_method: Regularization method. Only available ‘ridge’.
  - regu\_factor: Regularization factor for regularization method. Only
    applies when regu\_method is not null.

<!-- end list -->

``` r
logreg <- logistic_regression(train = train,
                              test = test,
                              target = 1,
                              lr = 0.1,
                              max_iter = 1000)

logreg$conf_matrix
```

    ## Confusion Matrix and Statistics
    ## 
    ##           Reference
    ## Prediction   0   1
    ##          0  95  21
    ##          1  40 165
    ##                                           
    ##                Accuracy : 0.81            
    ##                  95% CI : (0.7627, 0.8514)
    ##     No Information Rate : 0.5794          
    ##     P-Value [Acc > NIR] : < 2e-16         
    ##                                           
    ##                   Kappa : 0.6024          
    ##                                           
    ##  Mcnemar's Test P-Value : 0.02119         
    ##                                           
    ##             Sensitivity : 0.7037          
    ##             Specificity : 0.8871          
    ##          Pos Pred Value : 0.8190          
    ##          Neg Pred Value : 0.8049          
    ##              Prevalence : 0.4206          
    ##          Detection Rate : 0.2960          
    ##    Detection Prevalence : 0.3614          
    ##       Balanced Accuracy : 0.7954          
    ##                                           
    ##        'Positive' Class : 0               
    ## 

``` r
logreg$conf_matrix_plot
```

![](README_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

We can also use a ridge regularization factor:

``` r
logreg_ridge <- logistic_regression(train = train,
                              test = test,
                              target = 1,
                              lr = 0.1,
                              max_iter = 1000,
                              regu_method = 'ridge',
                              regu_factor = 0.1)

logreg_ridge$conf_matrix
```

    ## Confusion Matrix and Statistics
    ## 
    ##           Reference
    ## Prediction   0   1
    ##          0  96  22
    ##          1  39 164
    ##                                           
    ##                Accuracy : 0.81            
    ##                  95% CI : (0.7627, 0.8514)
    ##     No Information Rate : 0.5794          
    ##     P-Value [Acc > NIR] : <2e-16          
    ##                                           
    ##                   Kappa : 0.6032          
    ##                                           
    ##  Mcnemar's Test P-Value : 0.0405          
    ##                                           
    ##             Sensitivity : 0.7111          
    ##             Specificity : 0.8817          
    ##          Pos Pred Value : 0.8136          
    ##          Neg Pred Value : 0.8079          
    ##              Prevalence : 0.4206          
    ##          Detection Rate : 0.2991          
    ##    Detection Prevalence : 0.3676          
    ##       Balanced Accuracy : 0.7964          
    ##                                           
    ##        'Positive' Class : 0               
    ## 

``` r
logreg_ridge$conf_matrix_plot
```

![](README_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

# Issues

You can contact me if you find some bug, error or doubt
[here](https://github.com/AlbertoAlmuinha/LogisticRegression/issues) .

# License

LogisticRegression is licensed under the GNU General Public License
v3.0.

> Permissions of this strong copyleft license are conditioned on making
> available complete source code of licensed works and modifications,
> which include larger works using a licensed work, under the same
> license. Copyright and license notices must be preserved. Contributors
> provide an express grant of patent rights.
