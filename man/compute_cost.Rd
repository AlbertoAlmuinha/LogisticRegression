% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_cost.R
\name{compute_cost}
\alias{compute_cost}
\title{Cost Function Logistic Regression}
\usage{
compute_cost(x, y, theta, epsilon = 1e-05, regu_factor = NULL,
  regu_method = "ridge", ...)
}
\arguments{
\item{x}{Matrix with the predictor variables}

\item{y}{Matrix with the target variable}

\item{theta}{Matrix with the theta's values for sigmoid function}

\item{epsilon}{Numeric value}

\item{regu_factor}{Regularization Factor for Ridge Regularization Regression}

\item{regu_method}{Regularization Method. At this moment, only "ridge" available}

\item{...}{Other possible arguments}
}
\value{
Returns the cost function
}
\description{
Compute the Cost Function for Logistic Regression.
}
\author{
Alberto Almuiña
}
