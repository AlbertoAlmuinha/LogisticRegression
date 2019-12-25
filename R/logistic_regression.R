#' @title Logistic Regression
#' @description Logistic Regression for Binary Classification Problems
#' @author Alberto Almuiña
#' @param train Matrix with the predictor variables
#' @param test Matrix with the target variable
#' @param target Numeric value of the target variable
#' @param lr Learning Rate for Gradient Descent Algorithm
#' @param max_iter Number of iterations for Gradient Descent Algorithm
#' @param probs If the result must be given in probabilities or not.
#' @param threshold Threshold for gradient descent algorithm
#' @param regu_factor Regularization Factor for Ridge Regularization Regression
#' @param regu_method Regularization Method. At this moment, only "ridge" available
#' @param epsilon Numeric value
#' @param ... Other possible arguments
#' @return
#' Returns a list with the predicted data, confussion matrix, confussion matrix plot and optimal theta values
#' @export

logistic_regression<-function(train, test, target, lr = 0.001, max_iter = 100000, probs = F, threshold = NULL, regu_factor = NULL,
                              regu_method = "ridge", epsilon = 1e-5, ...){

  regu_method<-match.arg(regu_method)

  do.call(logistic_reg_comprobations, list(target, lr, max_iter, regu_factor, threshold, probs, epsilon))

  c(x_train, y_train, x_test, theta) %<-% prepare_logistic_reg_data(train, test, target)

  optim_theta<-gradient_descent(x_train, y_train, theta, lr, max_iter, threshold, regu_factor, regu_method, epsilon)

  c(predicted_train, predicted_test) %<-% predict(x_train, x_test, optim_theta[[1]])

  if(probs == F){
                
                
                predicted_train<-if_else(predicted_train>=0.5, 1, 0)
                
                predicted_test<-if_else(predicted_test>=0.5, 1, 0)
                
                conf_matrix<-confusionMatrix(as.factor(predicted_test), as.factor(test[, target] %>% as.matrix() %>% as.vector())))
                
                conf_matrix_plot<-ggplot(data = conf_matrix[[2]] %>% as.data.frame(),
                                         mapping = aes(x = Prediction, y = Reference)) +
                                         geom_tile(aes(fill = Freq), colour = "white") + 
                                         geom_text(aes(label = sprintf("%5.0f", Freq)), vjust = 1) +
                                         theme(legend.position = "none") +
                                         scale_fill_gradient(low = "blue",
                                                             high = "red",
                                                             trans = "log")
                
                return(list(predicted_train = predicted_train, 
                            predicted_test = predicted_test,
                            conf_matrix = conf_matrix, 
                            optim_theta = optim_theta,
                            conf_matrix_plot = conf_matrix_plot))
                
        } else{
                
                
                return(list(predicted_train = predicted_train,
                            predicted_test = predicted_test,
                            optim_theta = optim_theta))
        }
}
