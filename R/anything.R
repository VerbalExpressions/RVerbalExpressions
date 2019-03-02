#' Match any character(s) any (including zero) number of times.
#'
#' @description This expression will match everything except line breaks using
#' the \emph{dot} and the \emph{star}. The Dot \code{.} is a
#' \emph{metacharacter} and the Star \code{*} is a \emph{quantifier}. When
#' combined the expression is considered greedy because it will match everything
#' (except line breaks) 0 or more times.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' anything()
#'
#' x <- start_of_line() %>%
#'   anything() %>%
#'   end_of_line()
#'
#' grepl(x, "anything!") # this should be true
#'
#' @references
#' Dot: \url{https://www.regular-expressions.info/dot.html}
#'
#' Star Quantifier: \url{https://www.regular-expressions.info/repeat.html}
#' @export
anything <- function(.data = NULL) {
  paste0(.data, "(?:.*)")
}
