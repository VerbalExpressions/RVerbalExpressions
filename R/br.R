#' Match a line break (alias of \code{line_break()}).
#'
#' @details This function is looks for line breaks with the following
#' expression: \code{(?:\\r\\n|\\r|\\n)}
#' \enumerate{
#'   \item Unix style: \url{https://codepoints.net/U+000A}
#'   \item Windows style: \url{https://codepoints.net/U+000D}
#' }
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
#' @export
br <- function(.data = NULL) {
  paste0(.data, "(?:\\r\\n|\\r|\\n)")
}
