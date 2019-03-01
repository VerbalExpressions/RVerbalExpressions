#' Match a word.
#'
#' @details Match a word—a string of word characters (a–z, A–Z, 0–9 or _).
#' This function is looks for tabs with the following expression: \code{\\w+}
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' word()
#'
#' # create an expression
#' x <- word()
#'
#' # create inputs
#' string1 <- "foo_bar"
#' string2 <- "foo-bar"
#'
#' # extract matches
#' regmatches(string1, regexpr(x, string1))
#' regmatches(string2, regexpr(x, string2)) # doesn't match -
#' @export
word <- function(.data = NULL) {
  paste0(.data, "\\w+")
}
