#' Match any character(s) at least once.
#'
#' @description This expression is almost identical to \code{rx_anything()}
#' with one major exception, a \code{+} is used instead of a \code{*}. This
#' means \code{rx_something()} expects \emph{something} whereas
#' \code{anything()} expects \emph{anything} including... nothing!
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_something()
#'
#' # construct an expression
#' x <- rx_something()
#'
#' grepl(x, "something!")   # this should be true
#' grepl(x, "")             # this should be false
#' grepl(rx_anything(), "") # this should be true
#'
#' @references
#' Metacharacters: \url{https://www.regular-expressions.info/characters.html#special}
#' @export
rx_something <- function(.data = NULL) {
  paste0(.data, "(?:.+)")
}
