#' Match a line break (alias of \code{line_break()}).
#'
#' @description This expression looks for line breaks, both Unix and Windows
#' style by using the appropriate \emph{non printable characters}.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' br()
#'
#' # create an expression
#' x <- br()
#'
#' # create input
#' string <- "foo\nbar"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#'
#' @references
#' Unix style: \url{https://codepoints.net/U+000A}
#'
#' Windows style: \url{https://codepoints.net/U+000D}
#'
#' Non printable character: \url{https://www.regular-expressions.info/nonprint.html}
#' @export
br <- function(.data = NULL) {
  paste0(.data, "(?:\\r\\n|\\r|\\n)")
}
