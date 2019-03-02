#' Match any character(s) at least once.
#'
#' @description This expression is almost identical to \code{anything()}
#' with one major exception, a \code{+} is used instead of a \code{*}. This
#' means \code{something()} expects \emph{something} whereas
#' \code{anything()} expects \emph{anything} including... nothing!
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' something()
#'
#' # construct an expression
#' x <- something()
#'
#' grepl(x, "something!") # this should be true
#' grepl(x, "")           # this should be false
#' grepl(anything(), "")  # this should be true
#'
#' @references
#' Metacharacters: \url{https://www.regular-expressions.info/characters.html#special}
#' @export
something <- function(.data = NULL) {
  paste0(.data, "(?:.+)")
}
