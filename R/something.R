#' Match any character(s) at least once.
#'
#' @description This expression is almost identical to \code{anything()}
#' with one major exception, a \code{+} is used instead of a \code{*}. This
#' means \code{something()} expects \emph{something} whereas
#' \code{anything()} expects \emph{anything} including... nothing!
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param mode Matching mode (\code{greedy} (default) or\code{lazy}). \code{Lazy} matching stops after the first match, \code{greedy} continues
#' searching until end of the string and then back-tracks to the last match.
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
#'
#' Greedy and Lazy Quantifiers: \url{https://www.regular-expressions.info/repeat.html#greedy}
#' @export
something <- function(.data = NULL, mode="greedy") {
  switch(mode,
    greedy = paste0(.data, "(?:.+)"),
    lazy = paste0(.data, "(?:.+?)"),
    stop("Please, provide valid 'mode' argument")
  )
}
