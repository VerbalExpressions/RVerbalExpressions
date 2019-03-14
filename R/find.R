#' Match an expression.
#'
#' @description This expression uses a \emph{non capturing group} to identify a
#' specific pattern exactly.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Exact expression to match
#' @param rep Number of repetitions. Valid formats include "maybe/any/some" or numeric vector of \code{c(min, max)} or \code{min:max} number of repetitions, where \code{NA} indicates unbounded number of repetitions.
#' @param mode Repetition mode. Valid modes include "greedy/lazy/possessive".
#'
#' @examples
#' rx_find(value = "apple")
#'
#' # create expression
#' x <- rx_find(value = "apples")
#'
#' grepl(x, "apple")  # should be false
#' grepl(x, "apples") # should be true
#'
#' @references
#' Non capturing group: \url{https://www.regular-expressions.info/brackets.html}
#'
#' Stack Overflow: \url{https://stackoverflow.com/questions/3512471}
#' @export
rx_find <- function(.data, ..., rep=NULL, mode="greedy") {
  if (!inherits(.data, "rx_string")) stop("This function is not to be used as first element of the pipe! Please start pipe with constructor funcion rx()")
  san_args <- sapply(list(...), sanitize)
  res <- paste0(.data, "(?:", paste0(san_args, collapse = ""), ")", parse_rep_mode(rep, mode))
  new_rx(res)
}


#rx_find <- function(.data, value=NULL, rep=NULL, mode="greedy") {
#  UseMethod("rx_find", .data)
#}
#

#rx_find.rx_string <- function(.data, value=NULL, rep=NULL, mode="greedy") {
#  res <- paste0(.data, "(?:", sanitize(value), ")", parse_rep_mode(rep, mode))
#  new_rx(res)
#}
#

#rx_find.default <- function(.data, value=NULL, rep=NULL, mode="greedy") {
#  res <- paste0("(?:", sanitize(.data), value, ")", parse_rep_mode(rep, mode))
#  new_rx(res)
#}
