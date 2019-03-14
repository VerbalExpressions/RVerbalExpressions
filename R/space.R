#' Match a regular space character.
#'
#' @description Matches a literal space character.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param negate Invert match behavior, defaults to \code{FALSE} (match
#' space). Use \code{FALSE} to \emph{not} match space.
#'
#' @examples
#' # match space, default
#' rx_space()
#'
#' # dont match space
#' rx_space(negate = TRUE)
#'
#' # create an expression
#' x <- rx_space()
#'
#' # create input
#' string <- "1 apple\t"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#'
#' # extract no whitespace by inverting behavior
#' y <- rx_space(negate = TRUE)
#' regmatches(string, gregexpr(y, string))
#' @export
rx_space <- function(.data = NULL, rep=NULL, mode="greedy", negate = FALSE) {
  res <- paste0(.data, parse_negate(negate, " "), parse_rep_mode(rep, mode))
  new_rx(res)
}
