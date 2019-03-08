#' Match a word.
#'
#' @description Match a word—a string of word characters (a–z, A–Z, 0–9 or _).
#' This function is looks for tabs with the following expression: \code{\\w+}
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_word()
#'
#' # create an expression
#' x <- rx_word()
#'
#' # create inputs
#' string1 <- "foo_bar"
#' string2 <- "foo-bar"
#'
#' # extract matches
#' regmatches(string1, regexpr(x, string1))
#' regmatches(string2, regexpr(x, string2)) # doesn't match -
#' @export
rx_word <- function(.data = NULL) {
  paste0(.data, "\\w+")
}
