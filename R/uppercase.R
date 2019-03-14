#' Match upper case letters.
#'
#' @description Matches upper case letters only.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_uppercase()
#'
#' # create an expression
#' x <- rx_uppercase()
#'
#' # create input
#' string <- "Apple 1!"
#'
#' # extract match
#' regmatches(string, gregexpr(x, string))
#' @export
rx_uppercase <- function(.data = NULL, rep=NULL, mode="greedy", negate =FALSE) {
  res <- paste0(.data, parse_negate(negate, "[[:upper:]]"), parse_rep_mode(rep, mode))
  new_rx(res)
}

