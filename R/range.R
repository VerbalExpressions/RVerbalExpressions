#' Match any character within the range defined by the parameters.
#'
#' @description Value parameter will be interpreted as pairs. For example,
#' \code{range(c('a', 'z', '0', '9'))} will be interpreted to mean any
#' character within the ranges a–z (ascii x–y) or 0–9 (ascii x–y). The method
#' expects an even number of parameters; unpaired parameters are ignored.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Range of characters. The method expects an even number of
#' parameters; unpaired parameters are ignored.
#'
#' @examples
#' rx_range(value = c('1', '3'))
#'
#' # create an expression
#' x <- rx_range(value = c('1', '3'))
#'
#' grepl(x, "2") # should be true
#' grepl(x, "4") # should be false
#' @export
rx_range <- function(.data = NULL, value) {
  value <- split(value, ceiling(seq_along(value)/2))
  value <- value[lengths(value) == 2]
  value <- lapply(value, function(i) paste0(i[1], "-", i[2]))
  paste0(.data, "[", paste0(unlist(value, use.names = FALSE), collapse = ""), "]")
}
