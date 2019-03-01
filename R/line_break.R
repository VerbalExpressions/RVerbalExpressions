#' Match a line break.
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
#' line_break()
#'
#' # create an expression
#' x <- line_break()
#'
#' # create input
#' string <- "foo\nbar"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#' @export
line_break <- function(.data = NULL) {
  paste0(.data, "(?:\\r\\n|\\r|\\n)")
}
