#' Match a tab character.
#'
#' @details This function is looks for tabs with the following
#' expression: \code{\\t}
#' \enumerate{
#'   \item Tab character: \url{https://codepoints.net/U+0009}
#' }
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' tab()
#'
#' # create an expression
#' x <- tab()
#'
#' # create input
#' string <- "foo\tbar"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#' @export
tab <- function(.data = NULL) {
  paste0(.data, "\\t") # shouldn't this just be \t
}
