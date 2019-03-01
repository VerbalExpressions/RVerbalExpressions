#' Match a whitespace character.
#'
#' @details Match a whitespace character (one of space, tab, carriage return,
#' new line, vertical tab and form feed). This function is looks for tabs with
#' the following expression: \code{\\d}
#' \enumerate{
#'   \item space: \url{https://codepoints.net/U+0020}
#'   \item tab: \url{https://codepoints.net/U+0009}
#'   \item carriage return: \url{https://codepoints.net/U+000D}
#'   \item new line: \url{https://codepoints.net/U+000}
#'   \item vertical tab: \url{https://codepoints.net/U+000B}
#'   \item form feed: \url{https://codepoints.net/U+000C}
#' }
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' whitespace()
#'
#' # create an expression
#' x <- whitespace()
#'
#' # create input
#' string <- "1 apple"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#' @export
whitespace <- function(.data = NULL) {
  paste0(.data, "\\s")
}
