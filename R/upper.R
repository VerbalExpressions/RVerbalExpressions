#' Match upper case letters.
#'
#' @description Matches upper case letters only.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_upper()
#'
#' # create an expression
#' x <- rx_upper()
#'
#' # create input
#' string <- "Apple 1!"
#'
#' # extract match
#' regmatches(string, gregexpr(x, string))
#' @export
rx_upper <- function(.data = NULL) {
  paste0(.data, "[[:upper:]]")
}
