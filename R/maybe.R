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
#' maybe(value = "abc")
#'
#' # create expression
#' x <- start_of_line() %>%
#'   maybe("abc") %>%
#'   end_of_line(enable = FALSE)
#'
#' grepl(x, "xyz") # should be true
#'
#' @references
#' Quantifiers: \url{https://www.regular-expressions.info/optional.html}
#' @export
maybe <- function(.data = NULL, value) {
  paste0(.data, "(?:", sanitize(value), ")?")
}
