#' Match any character(s) any (including zero) number of times.
#'
#' @description This expression will match everything except line breaks using
#' the \emph{dot} and the \emph{star}. The Dot \code{.} is a
#' \emph{metacharacter} and the Star \code{*} is a \emph{quantifier}. When
#' combined the expression is considered greedy because it will match everything
#' (except line breaks) 0 or more times.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param mode Matching mode (\code{greedy} (default) or\code{lazy}). \code{Lazy} matching stops after the first match, \code{greedy} continues
#' searching until end of the string and then back-tracks to the last match.
#'
#' @examples
#' rx_anything()
#' rx_anything(mode = "lazy")
#'
#' x <- rx_start_of_line() %>%
#'   rx_anything() %>%
#'   rx_end_of_line()
#'
#' grepl(x, "anything!")  # this should be true
#' grepl(rx_anything(), "")  # this should be true
#' grepl(rx_something(), "") # this should be false
#'
#' @references
#' Dot: \url{https://www.regular-expressions.info/dot.html}
#'
#' Star Quantifier: \url{https://www.regular-expressions.info/repeat.html}
#'
#' Greedy and Lazy Quantifiers: \url{https://www.regular-expressions.info/repeat.html#greedy}
#' @export
rx_anything <- function(.data = NULL, mode = "greedy") {
  switch(mode,
    greedy = paste0(.data, "(?:.*)"),
    lazy = paste0(.data, "(?:.*?)"),
    stop("Please, provide valid 'mode' argument")
  )
}
