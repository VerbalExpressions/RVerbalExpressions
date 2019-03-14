#' Match lower case letters.
#'
#' @description Matches lower case letters only.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' lower case). Use \code{TRUE} to \emph{not} match lower case.
#'
#' @examples
#' rx_lowercase()
#' rx_lowercase(inverse = TRUE)
#'
#' # create an expression
#' x <- rx_lowercase()
#' y <- rx_lowercase(inverse = TRUE)
#'
#' # create input
#' string <- "Apple 1!"
#'
#' # extract match
#' regmatches(string, gregexpr(x, string))
#' regmatches(string, gregexpr(y, string))
#' @export
rx_lowercase <- function(.data = NULL, rep=NULL, mode="greedy", negate =FALSE) {
  res <- paste0(.data, parse_negate(negate, "[[:lower:]]"), parse_rep_mode(rep, mode))
  new_rx(res)
}
