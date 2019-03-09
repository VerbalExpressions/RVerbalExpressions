#' Match alphabetic characters.
#'
#' @description Matches letters (case insensitive) only.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_alpha()
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
rx_alpha <- function(.data = NULL) {
  paste0(.data, "[[:alpha:]]")
}
