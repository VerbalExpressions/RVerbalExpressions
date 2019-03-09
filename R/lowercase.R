#' Match lower case letters.
#'
#' @description Matches lower case letters only.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_lowercase()
#'
#' # create an expression
#' x <- rx_lowercase()
#'
#' # create input
#' string <- "Apple 1!"
#'
#' # extract match
#' regmatches(string, gregexpr(x, string))
#' @export
rx_lowercase <- function(.data = NULL) {
  paste0(.data, "[[:lower:]]")
}
