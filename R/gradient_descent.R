#' @title Gradient Descent Algorithm
#' @description Gradient Descent Algorithm to get the best values of theta for logistic regression
#' @author Alberto Almuiña
#' @param x Matrix with the predictor variables
#' @param y Matrix with the target variable
#' @param theta Matrix with the theta's values for sigmoid function
#' @param lr Learning Rate for Gradient Descent Algorithm
#' @param max_iter Number of iterations for Gradient Descent Algorithm
#' @param threshold Threshold for Gradient Descent Algorithm
#' @param regu_factor Regularization Factor for Ridge Regularization Regression
#' @param regu_method Regularization Method. At this moment, only "ridge" available
#' @param epsilon Numeric value
#' @return
#' Returns the optimal theta's values and the cost function values
#' @export

gradient_descent<-function(x, y, theta, lr, max_iter, threshold, regu_factor, regu_method, epsilon){

  m<-length(y)

  cost_history<-zeros(max_iter,1)

  for(i in seq(max_iter)){

    partial_deriv<-t(x)%*%(sigmoid(x %*% theta)-y)


    if(!is.null(regu_factor) & regu_method == "ridge"){

      regularization<-(regu_factor/m)*theta

      theta<-theta-((lr/m) * partial_deriv) + regularization

      cost_history[i,1]<-compute_cost(x, y, theta, epsilon, regu_factor, regu_method)


    } else{

      theta<-theta-(lr/m)*partial_deriv

      cost_history[i,1]<-compute_cost(x, y, theta)

    }


    if(!is.null(threshold)){

      if(cost_history[i,1] <= threshold){break()}
    }

  }

  return(list(theta=theta, cost_history = cost_history))

}
