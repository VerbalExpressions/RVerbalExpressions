#' Match alphabetic characters.
#'
#' @description Matches letters (case insensitive) only.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param negate Invert match behavior, defaults to \code{FALSE} (match
#' alphabetic characters). Use \code{FALSE} to \emph{not} match alphabetic
#' characters.
#'
#' @examples
#' rx_alpha()
#' rx_alpha(negate = TRUE)
#'
#' # create an expression
#' x <- rx_alpha()
#'
#' # create input
#' string <- "Apple 1!"
#'
#' # extract match
#' regmatches(string, gregexpr(x, string))
#' @export
rx_alpha <- function(.data = NULL, rep=NULL, mode="greedy", negate =FALSE) {
  res <- paste0(.data, parse_negate(negate, "[[:alpha:]]"), parse_rep_mode(rep, mode))
  new_rx(res)
}
