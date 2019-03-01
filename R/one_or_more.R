#' Match the previous stuff one or more times.
#'
#' @description This function simply adds a + to the end of the expression.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' one_or_more()
#' # create an expression
#' x <- find(value = "a") %>%
#'   one_or_more()
#'
#' # create input
#' input <- "aaa"
#'
#' # extract match
#' regmatches(input, regexpr(x, input))
#' @export
one_or_more <- function(.data = NULL) {
  paste0(.data, "+")
}
