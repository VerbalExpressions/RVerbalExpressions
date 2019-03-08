#' Match the previous stuff one or more times.
#'
#' @description This function simply adds a + to the end of the expression.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_one_or_more()
#'
#' # create an expression
#' x <- rx_find(value = "a") %>%
#'   rx_one_or_more()
#'
#' # create input
#' input <- "aaa"
#'
#' # extract match
#' regmatches(input, regexpr(x, input))
#' @export
rx_one_or_more <- function(.data = NULL) {
  paste0(.data, "+")
}
