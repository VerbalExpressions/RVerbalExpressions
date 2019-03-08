#' Match any character(s) except these at least once.
#'
#' @description This expression is almost identical to \code{anything_but()}
#' with one major exception, a \code{+} is used instead of a \code{*}. This
#' means \code{something_but()} expects \emph{something} whereas
#' \code{anything_but()} expects \emph{anything} including... nothing!
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Expression to optionally match
#' @param mode Matching mode (\code{greedy} (default) or\code{lazy}). \code{Lazy} matching stops after the first match, \code{greedy} continues
#' searching until end of the string and then back-tracks to the last match.
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
#'
#' Greedy and Lazy Quantifiers: \url{https://www.regular-expressions.info/repeat.html#greedy}
#' @export
something_but <- function(.data = NULL, value, mode="greedy") {
  switch(mode,
    greedy = paste0(.data, "(?:[^", sanitize(value), "]+)"),
    lazy = paste0(.data, "(?:[^", sanitize(value), "]+?)"),
    stop("Please, provide valid 'mode' argument")
  )
}
