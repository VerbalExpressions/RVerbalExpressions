#' Match lower case letters.
#'
#' @description Matches lower case letters only.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_lower()
#'
#' # create an expression
#' x <- rx_lower()
#'
#' # create input
#' string <- "Apple 1!"
#'
#' # extract match
#' regmatches(string, gregexpr(x, string))
#' @export
rx_lower <- function(.data = NULL) {
  paste0(.data, "[[:lower:]]")
}
