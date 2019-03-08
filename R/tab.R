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
#' rx_tab()
#'
#' # create an expression
#' x <- rx_tab()
#'
#' # create input
#' string <- "foo\tbar"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#' @export
rx_tab <- function(.data = NULL) {
  paste0(.data, "\\t") # shouldn't this just be \t
}
