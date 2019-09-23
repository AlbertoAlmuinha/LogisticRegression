#' @title Sigmoid Function
#' @description Sigmoid function.
#' @author Alberto Almuiña
#' @param x Values to compute.
#' @return
#' Returns the values of the sigmoid function.
#' @export

sigmoid<-function(x){

  return(1/(1+exp(-x)))
}
