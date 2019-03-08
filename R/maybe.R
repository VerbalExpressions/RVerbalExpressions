#' Optionally match an expression.
#'
#' @description This expression uses a \emph{quantifier} \code{?} to optionally
#' match things. Specifically, the question mark makes the preceding token in
#' the regular expression optional.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Expression to optionally match
#'
#' @examples
#' rx_maybe(value = "abc")
#'
#' # create expression
#' x <- rx_start_of_line() %>%
#'   rx_maybe("abc") %>%
#'   rx_end_of_line(enable = FALSE)
#'
#' grepl(x, "xyz") # should be true
#'
#' @references
#' Quantifiers: \url{https://www.regular-expressions.info/optional.html}
#' @export
rx_maybe <- function(.data = NULL, value) {
  paste0(.data, "(?:", sanitize(value), ")?")
}
