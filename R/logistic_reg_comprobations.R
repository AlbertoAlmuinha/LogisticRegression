#' @title Logistic Regression Comprobations
#' @description Comprobations for the "logistic_regression" function parameters.
#' @author Alberto Almuiña
#' @param target Variable target for logistic regression
#' @param lr Learning rate for gradient descent algorithm
#' @param max_iter Number of iterations for gradient descent algorithm
#' @param regu_factor Regularization factor for Ridge Regularization
#' @param threshold Threshold to stop gradient descent algorithm base on the value of the cost function
#' @param probs If the results must be given like probabilities or not.
#' @param epsilon Numeric parameter for computation
#' @return
#' Returns the mean values for the metric selected
#' @export

logistic_reg_comprobations<-function(target, lr, max_iter, regu_factor, threshold, probs, epsilon){

  if(!is.numeric(target)|| !is.numeric(lr)|| !is.numeric(max_iter) || !is.numeric(epsilon)){

    stop("'target', 'lr' , 'epsilon' and 'max_iter' parameters must be numeric")
  }

  if(!is.null(regu_factor) & !is.numeric(regu_factor)){stop("'regu_factor' parameter must be numeric")}

  if(!is.null(threshold) & !is.numeric(threshold)){stop("'threshold' parameter must be numeric")}

  if(!is.logical(probs)){stop("'probs' parameter must be logical")}
}
