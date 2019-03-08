#' Match an expression.
#'
#' @description This expression uses a \emph{non capturing group} to identify a
#' specific pattern exactly.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Exact expression to match
#'
#' @examples
#' rx_find(value = "apple")
#'
#' # create expression
#' x <- rx_find(value = "apples")
#'
#' grepl(x, "apple")  # should be false
#' grepl(x, "apples") # should be true
#'
#' @references
#' Non capturing group: \url{https://www.regular-expressions.info/brackets.html}
#'
#' Stack Overflow: \url{https://stackoverflow.com/questions/3512471}
#' @export
rx_find <- function(.data = NULL, value) {
  paste0(.data, "(?:", sanitize(value), ")")
}
