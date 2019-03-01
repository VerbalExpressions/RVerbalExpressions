#' Match a digit (0–9).
#'
#' @details This function is looks for tabs with the following expression:
#' \code{\\d}
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' digit()
#'
#' # create an expression
#' x <- digit()
#'
#' # create input
#' string <- "1 apple"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#' @export
digit <- function(.data = NULL) {
  paste0(.data, "\\d")
}
