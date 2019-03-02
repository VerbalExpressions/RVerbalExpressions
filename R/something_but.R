#' Match any character(s) except these at least once.
#'
#' @description This expression is almost identical to \code{anything_but()}
#' with one major exception, a \code{+} is used instead of a \code{*}. This
#' means \code{something_but()} expects \emph{something} whereas
#' \code{anything_but()} expects \emph{anything} including... nothing!
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Expression to optionally match
#'
#' @examples
#' something_but(value = "abc")
#'
#' # create an expression
#' x <- something_but(value = "python")
#'
#' grepl(x, "R")  # should be true
#' grepl(x, "py") # should be false
#'
#' @references
#' Metacharacters: \url{https://www.regular-expressions.info/characters.html#special}
#' @export
something_but <- function(.data = NULL, value) {
  paste0(.data, "(?:[^", sanitize(value), "]+)")
}
