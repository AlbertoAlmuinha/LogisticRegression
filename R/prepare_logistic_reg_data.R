#' @title Logistic Regression Data Preparation
#' @description Data preparation for the "logistic_regression" function.
#' @author Alberto Almuiña
#' @param train Dataframe to train
#' @param test Dataframe to test
#' @param target Variable target for logistic regression
#' @return
#' Returns the data expected by "logistic_regression" function as a list.
#' @export


prepare_logistic_reg_data<-function(train, test, target){

  x_train<-cbind(rep(1, nrow(train)), train[,-target]) %>% as.matrix()

  y_train<-train[,target] %>% as.matrix()

  x_test<-cbind(rep(1,nrow(test)), test[,-target] %>% as.matrix())

  theta<-rep(0, ncol(x_train)) %>% as.matrix()

  return(list(x_train = x_train,
              y_train = y_train,
              x_test = x_test,
              theta = theta))
}
