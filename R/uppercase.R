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
rx_uppercase <- function(.data = NULL) {
  paste0(.data, "[[:upper:]]")
}
