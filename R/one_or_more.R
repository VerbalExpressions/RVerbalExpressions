#' Match the previous stuff one or more times.
#'
#' @description This function simply adds a + to the end of the expression.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param mode Matching mode (\code{greedy} (default) or\code{lazy}). \code{Lazy} matching stops after the first match, \code{greedy} continues
#' searching until end of the string and then back-tracks to the last match.
#'
#' @examples
#' rx_one_or_more()
#'
#' # create an expression
#' x <- rx_find(value = "a") %>%
#'   rx_one_or_more()
#'
#' # create input
#' input <- "aaa"
#'
#' # extract match
#' regmatches(input, regexpr(x, input))
#' @export
rx_one_or_more <- function(.data = NULL, mode = "greedy") {
  res <- paste0(.data, parse_rep_mode(rep="some", mode))
  new_rx(res)
}

#' Match the previous stuff zero or many times.
#'
#' @description This function simply adds a * to the end of the expression.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param mode Matching mode (\code{greedy} (default) or\code{lazy}). \code{Lazy} matching stops after the first match, \code{greedy} continues
#' searching until end of the string and then back-tracks to the last match.
#'
#' @examples
#' rx_none_or_more()
#'
#' # create an expression
#' x <- rx_find(value = "a") %>%
#'   rx_none_or_more()
#'
#' # create input
#' input <- "aaa"
#'
#' # extract match
#' regmatches(input, regexpr(x, input))
#' @export
rx_none_or_more <- function(.data = NULL, mode = "greedy") {
  res <- paste0(.data, parse_rep_mode(rep="any", mode))
  new_rx(res)
}
