#' Match any character(s) except these at least once.
#'
#' @description This expression is almost identical to \code{rx_anything_but()}
#' with one major exception, a \code{+} is used instead of a \code{*}. This
#' means \code{rx_something_but()} expects \emph{something} whereas
#' \code{rx_anything_but()} expects \emph{anything} including... nothing!
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Expression to optionally match
#'
#' @examples
#' rx_something_but(value = "abc")
#'
#' # create an expression
#' x <- rx_something_but(value = "python")
#'
#' grepl(x, "R")  # should be true
#' grepl(x, "py") # should be false
#'
#' @references
#' Metacharacters: \url{https://www.regular-expressions.info/characters.html#special}
#' @export
rx_something_but <- function(.data = NULL, value) {
  paste0(.data, "(?:[^", sanitize(value), "]+)")
}
