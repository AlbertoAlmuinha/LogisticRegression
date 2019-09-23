#' @title Cost Function Logistic Regression
#' @description Compute the Cost Function for Logistic Regression
#' @author Alberto Almuiña
#' @param x Matrix with the predictor variables
#' @param y Matrix with the target variable
#' @param theta Matrix with the theta's values for sigmoid function
#' @param epsilon Numeric value
#' @param regu_factor Regularization Factor for Ridge Regularization Regression
#' @param regu_method Regularization Method. At this moment, only "ridge" available
#' @param ... Other possible arguments
#' @return
#' Returns the cost function
#' @export

compute_cost<-function(x, y, theta, epsilon = 1e-5, regu_factor = NULL, regu_method = "ridge", ...){

  m<-length(y)

  h<-sigmoid(x %*% theta)

  positive<-t(-y) %*% log(h+epsilon)

  negative<-t(1-y) %*% log(1-h+epsilon)

  if(!is.null(regu_factor) & regu_method == "ridge"){

    regularization<-(regu_factor/(2*m)) * (t(theta) %*% theta)

    cost<-(1/m)*(positive - negative) + regularization
  } else{

    cost<-(1/m)*(positive - negative)
  }



  return(cost)
}
