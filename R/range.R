#' Match any character within the range defined by the parameters.
#'
#' @details This function is slighly different than \code{start_of_line()}
#' because it has the additional argument \code{.data} which allows the user to
#' pass a value to to it. This is meant to allow \code{dplyr} chains to
#' function properly as \code{.data} defaults to \code{NULL} and will pull
#' the data from the previous step in the chain.
#'
#' Arguments will be interpreted as pairs.
#'
#' For example, \code{range(c('a', 'z', '0', '9'))} will be interpreted to mean
#' any character within the ranges a–z (ascii x–y) or 0–9 (ascii x–y). The
#' method expects an even number of parameters; unpaired parameters are ignored.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Range of characters. The method expects an even number of
#' parameters; unpaired parameters are ignored.
#'
#' @examples
#' range(value = c('1', '3'))
#'
#' # create an expression
#' x <- range(value = c('1', '3'))
#'
#' grepl(x, "2") # should be true
#' grepl(x, "4") # should be false
#' @export
range <- function(.data = NULL, value) {
  value <- split(value, ceiling(seq_along(value)/2))
  value <- value[lengths(value) == 2]
  value <- lapply(value, function(i) paste0(i[1], "-", i[2]))
  paste0(.data, "[", paste0(unlist(value, use.names = FALSE), collapse = ""), "]")
}
