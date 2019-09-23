#' @title Predict
#' @description Predict for Logistic Regression
#' @author Alberto Almuiña
#' @param x_train Matrix with the predictor variables of the training dataset
#' @param x_test Matrix with the predictor variables of the test dataset
#' @param theta Matrix with the theta's values for sigmoid function
#' @return
#' Returns the predicted values for logistic regression
#' @export

predict<-function(x_train,x_test, theta){

  pred_train<-sigmoid(x_train %*% theta)

  pred_test<-sigmoid(x_test %*% theta)

  return(list(pred_train = pred_train,
              pred_test = pred_test))
}
