#' Match a digit (0–9).
#'
#' @description The function \code{rx_digit()}looks for tabs with the following
#' expression: \code{\%\%d} and matches single digit.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param negate Invert match behavior, defaults to \code{FALSE} (match
#' digit characters). Use \code{FALSE} to \emph{not} match digit characters.
#'
#' @examples
#' rx_digit()
#' rx_digit(negate = TRUE)
#'
#' # create an expression
#' x <- rx_digit()
#'
#' # create input
#' string <- "1 apple"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#' @export
rx_digit <- function(.data = NULL, rep=NULL, mode="greedy", negate = FALSE) {
  res <- paste0(.data, parse_negate(negate, "\\d", "\\D"), parse_rep_mode(rep, mode))
  new_rx(res)
}

