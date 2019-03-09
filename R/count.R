#' Match the previous stuff exact number of times.
#'
#' @description This function simply adds a \code{{n}} to the end of the expression.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param n Number of times previous expression shall be repeated. Default is 1.
#'
#' @examples
#' rx_count()
#'
#' # create an expression
#' x <- rx_find(value = "a") %>%
#'   rx_count(3)
#'
#' # create input
#' input <- "aaa"
#'
#' # extract match
#' regmatches(input, regexpr(x, input))
#'
#' @export
rx_count <- function(.data = NULL, n = 1) {
  paste0(.data, "{", n,"}")
}
